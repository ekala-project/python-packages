{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
  black,
  toml,
}:

buildPythonPackage rec {
  pname = "pytest-black";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_black";
    inherit version;
    hash = "sha256-7Ld0VfN5gFy0vY9FqBOjdUw7vuMZmt8bNmXA39CGtRE=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    black
    toml
  ];

  pythonImportsCheck = [ "pytest_black" ];

  meta = {
    description = "Pytest plugin to enable format checking with black";
    homepage = "https://github.com/shopkeep/pytest-black";
    license = lib.licenses.mit;
  };
}
