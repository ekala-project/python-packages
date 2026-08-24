{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, importlib-metadata
, importlib-resources
, jinja2
, mkdocs
, pyparsing
, pyyaml
, pyyaml-env-tag
, verspec
, versionCheckHook
, shtab
, fetchpatch
,
}:

buildPythonPackage rec {
  pname = "mike";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jimporter";
    repo = "mike";
    tag = "v${version}";
    hash = "sha256-+QFtInHma433XI4EcMTpFKZVdk+x2JREo73qM35G0pQ=";
  };

  patches = [
    (fetchpatch {
      name = "fix-shtab-unit-tests.patch";
      url = "https://github.com/jimporter/mike/commit/22ccb5f6d6e53285845d38a9559afab7248b5c9b.patch";
      hash = "sha256-hzTNkdq283+ybw0Fn5vIEMtgH7F1gt84ZzwL3Ru+5MY=";
    })
  ];

  build-system = [
    setuptools
  ];

  dependencies = [
    importlib-metadata
    importlib-resources
    jinja2
    mkdocs
    pyparsing
    pyyaml
    pyyaml-env-tag
    verspec
  ];

  nativeInstallCheckInputs = [ versionCheckHook ];

  meta = {
    description = "Manage multiple versions of your MkDocs-powered documentation via Git";
    homepage = "https://github.com/jimporter/mike";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    mainProgram = "mike";
  };
}
