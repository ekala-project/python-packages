{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,

  # build-system
  hatchling,
  versioningit,

  # dependencies
  jinja2,
  jsonschema,
  narwhals,
  numpy,
  packaging,
  pandas,
  toolz,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "altair";
  version = "6.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "altair-viz";
    repo = "altair";
    tag = "v${finalAttrs.version}";
    hash = "sha256-rq9xs2Otqx38vtAMO6PRjvmIW5HKRuuAX15X96XDBOU=";
  };

  build-system = [
    hatchling
    versioningit
  ];

  dependencies = [
    jinja2
    jsonschema
    narwhals
    numpy
    packaging
    pandas
    toolz
  ]
  ++ lib.optionals (pythonOlder "3.14") [
    typing-extensions
  ];

  pythonImportsCheck = [ "altair" ];

  meta = {
    description = "Declarative statistical visualization library for Python";
    homepage = "https://altair-viz.github.io";
    downloadPage = "https://github.com/altair-viz/altair";
    license = lib.licenses.bsd3;
  };
})
