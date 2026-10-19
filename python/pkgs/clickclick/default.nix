{
  lib,
  buildPythonPackage,
  click,
  fetchFromCodeberg,
  flake8,
  pytest-cov-stub,
  pyyaml,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "clickclick";
  version = "20.10.2";
  pyproject = true;

  src = fetchFromCodeberg {
    owner = "hjacobs";
    repo = "python-clickclick";
    tag = finalAttrs.version;
    hash = "sha256-gefU6CI4ibtvonsaKZmuffuUNUioBn5ODs72BI5zXOw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flake8
    click
    pyyaml
    six
  ];
  pythonImportsCheck = [ "clickclick" ];
  meta = {
    description = "Click command line utilities";
    homepage = "https://codeberg.org/hjacobs/python-clickclick/";
    license = lib.licenses.asl20;
  };
})
