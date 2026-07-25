{
  lib,
  stdenv,
  python,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  babel,
  markupsafe,
  sphinxHook,
  pallets-sphinx-themes,
  sphinxcontrib-log-cabinet,
  sphinx-issues,
}:

buildPythonPackage rec {
  pname = "jinja2";
  version = "3.1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ATf7BZkNNfEnWlh+mu5tVtqCH8g0kaD7g4GDvkP2bW0=";
  };

  postPatch = ''
    # Do not test with trio, it increases jinja2's dependency closure by a lot
    # and everyone consuming these dependencies cannot rely on sphinxHook,
    # because sphinx itself depends on jinja2.
    substituteInPlace tests/test_async{,_filters}.py \
      --replace-fail "import trio" "" \
      --replace-fail ", trio.run" "" \
      --replace-fail ", \"trio\"" ""
  '';

  build-system = [ flit-core ];

  dependencies = [ markupsafe ];

  optional-dependencies = {
    i18n = [ babel ];
  };

  # Multiple tests run out of stack space on 32bit systems with python2.
  # See https://github.com/pallets/jinja/issues/1158
  doCheck = !stdenv.hostPlatform.is32bit;
  passthru.doc = stdenv.mkDerivation {
    # Forge look and feel of multi-output derivation as best as we can.
    #
    # Using 'outputs = [ "doc" ];' breaks a lot of assumptions.
    pname = "${pname}-doc";
    inherit src version;

    patches = [
      # Fix import of "sphinxcontrib-log-cabinet"
      ./patches/import-order.patch
    ];

    postInstallSphinx = ''
      mv $out/share/doc/* $out/share/doc/python$pythonVersion-$pname-$version
    '';

    nativeBuildInputs = [
      sphinxHook
      sphinxcontrib-log-cabinet
      pallets-sphinx-themes
      sphinx-issues
    ];

    inherit (python) pythonVersion;
    inherit meta;
  };
  meta = {
    description = "Very fast and expressive template engine";
    downloadPage = "https://github.com/pallets/jinja";
    homepage = "https://jinja.palletsprojects.com";
    license = lib.licenses.bsd3;
    longDescription = ''
      Jinja is a fast, expressive, extensible templating engine. Special
      placeholders in the template allow writing code similar to Python
      syntax. Then the template is passed data to render the final document.
    '';
    maintainers = [ ];
  };
}
