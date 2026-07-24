{
  lib,
  buildPythonPackage,
  fetchPypi,
  pint,
  pytest-cov-stub,
  setuptools,
  toml,
}:

buildPythonPackage rec {
  pname = "vulture";
  version = "2.14";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-y4J3kCoRON7qt5bsW+9wdqbgJIyjYHo/Pe4LbZ6bhBU=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "vulture" ];

  meta = {
    description = "Finds unused code in Python programs";
    homepage = "https://github.com/jendrikseipp/vulture";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "vulture";
  };
}
