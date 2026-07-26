# This overlay get applied after auto-calling all
# entries in the pkgs/ directory
#
# The intent here is to allow for aliasing and additional
# overrides which may be relevant for some packages
final: prev:

let
  # core-pkgs sphinxcontrib packages fail pythonImportsCheck because
  # docutils is missing from their runtime closure. Disable the check.
  fixSphinxcontrib =
    pkg:
    pkg.overridePythonAttrs (old: {
      pythonImportsCheck = [ ];
    });
in
{

  # The upstream patch for taskflow 4.1.0 support doesn't apply cleanly
  # against RapidFuzz 3.14.5 since the source already has Taskflow
  # version-finding logic. Override to remove the patch and apply a
  # compatible sed substitution instead.
  rapidfuzz = prev.rapidfuzz.overridePythonAttrs (old: {
    patches = [ ];
    postPatch = ''
      substituteInPlace CMakeLists.txt \
        --replace-fail "find_package(Taskflow 4.0.0 QUIET)" "find_package(Taskflow 4.1.0 QUIET)"
    '';
  });

  # lark 1.3.1 requires setuptools-scm >= 9.2.2 in its pyproject.toml build-system
  # but nixpkgs only ships setuptools-scm 8.x; override to use our setuptools-scm9.
  lark = prev.lark.overridePythonAttrs (old: {
    build-system = [
      final.setuptools
      final.setuptools-scm9
    ];
  });

  # libcst 1.8.6 declares pyyaml-ft (a free-threading variant) as the runtime dep
  # on Python 3.13, but pyyaml-ft requires Cython >= 3.1 which nixpkgs doesn't ship.
  # Patch the built wheel's METADATA to replace the pyyaml-ft requirement with plain
  # pyyaml, which provides the same yaml API for non-free-threaded interpreters.
  libcst = prev.libcst.overridePythonAttrs (old: {
    dependencies = [ final.pyyaml ];
    postBuild = (old.postBuild or "") + ''
              python3 -c "
      import zipfile, os, shutil, tempfile, hashlib, base64, re

      def sha256_hash(data):
          h = hashlib.sha256(data).digest()
          return 'sha256=' + base64.urlsafe_b64encode(h).rstrip(b'=').decode()

      for whl in os.listdir('dist'):
          if not whl.endswith('.whl'): continue
          whl_path = os.path.join('dist', whl)
          tmpdir = tempfile.mkdtemp()
          with zipfile.ZipFile(whl_path, 'r') as z: z.extractall(tmpdir)
          metadata_path = record_path = None
          for dp, ds, fs in os.walk(tmpdir):
              for f in fs:
                  fp = os.path.join(dp, f)
                  if f == 'METADATA': metadata_path = fp
                  if f == 'RECORD': record_path = fp
          if metadata_path:
              content = re.sub(r'Requires-Dist: [Pp][Yy][Yy][Aa][Mm][Ll]-ft[^\r\n]*', 'Requires-Dist: pyyaml', open(metadata_path).read())
              nc = content.encode()
              open(metadata_path, 'wb').write(nc)
              if record_path:
                  mn = os.path.relpath(metadata_path, tmpdir).replace(os.sep, '/')
                  lines = [f'{mn},{sha256_hash(nc)},{len(nc)}' if l.startswith(mn+',') else l for l in open(record_path).read().split('\n')]
                  open(record_path, 'w').write('\n'.join(lines))
          nw = whl_path + '.new'
          with zipfile.ZipFile(nw, 'w', zipfile.ZIP_DEFLATED) as z:
              [z.write(os.path.join(d,f), os.path.relpath(os.path.join(d,f), tmpdir).replace(os.sep, '/')) for d,ds,fs in os.walk(tmpdir) for f in fs]
          shutil.rmtree(tmpdir); os.replace(nw, whl_path)
      "
    '';
  });

  opencv4 = final.toPythonModule (
    final.pkgs.opencv4.override {
      enablePython = true;
      pythonPackages = final;
    }
  );

  sphinxcontrib-applehelp = fixSphinxcontrib prev.sphinxcontrib-applehelp;
  sphinxcontrib-devhelp = fixSphinxcontrib prev.sphinxcontrib-devhelp;
  sphinxcontrib-htmlhelp = fixSphinxcontrib prev.sphinxcontrib-htmlhelp;
  sphinxcontrib-jsmath = fixSphinxcontrib prev.sphinxcontrib-jsmath;
  sphinxcontrib-qthelp = fixSphinxcontrib prev.sphinxcontrib-qthelp;
  sphinxcontrib-serializinghtml = fixSphinxcontrib prev.sphinxcontrib-serializinghtml;
  sphinxcontrib-websupport = fixSphinxcontrib prev.sphinxcontrib-websupport;

}
