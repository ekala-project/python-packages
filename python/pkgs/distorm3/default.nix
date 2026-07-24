{
  lib,
  fetchPypi,
  buildPythonPackage,
  python,
  setuptools,
  jaraco-functools,
  more-itertools,
  packaging,
  jaraco-collections,
}:

buildPythonPackage rec {
  pname = "distorm3";
  version = "3.5.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dSgii5BdEolyIF6bbLafMo3OD+uqc1W5L64QGoMJ4UQ=";
  };

  build-system = [ setuptools ];

  preBuild =
    let
      siteDir = pkg: "${pkg}/${python.sitePackages}";
      distutilsDeps = [
        jaraco-functools
        more-itertools
        packaging
        jaraco-collections
      ];
      extraPaths = lib.concatMapStringsSep ":" siteDir distutilsDeps;
    in
    ''
      mkdir -p "$TMPDIR/distutils-shim"
      ln -s "${siteDir setuptools}/setuptools/_distutils" "$TMPDIR/distutils-shim/distutils"
      export PYTHONPATH="$TMPDIR/distutils-shim:${siteDir setuptools}:${extraPaths}''${PYTHONPATH:+:$PYTHONPATH}"
    '';

  doCheck = false;

  pythonImportsCheck = [ "distorm3" ];

  meta = {
    description = "Disassembler library for x86/AMD64";
    homepage = "https://github.com/gdabah/distorm";
    license = lib.licenses.bsd3;
  };
}
