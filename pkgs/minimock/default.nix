{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "minimock";
  version = "1.2.8";
  pyproject = true;

  src = fetchPypi {
    pname = "MiniMock";
    inherit version;
    hash = "sha256-X9/f6t8Px4HQWSobkNL8wRWB9oL/fLpiAc/bFcPqWkw=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "minimock" ];

  meta = {
    homepage = "https://pypi.org/project/MiniMock/";
    description = "Minimalistic mocking library";
    license = lib.licenses.mit;
  };
}
