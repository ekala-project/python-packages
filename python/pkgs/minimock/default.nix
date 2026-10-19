{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "minimock";
  version = "1.2.8";
  pyproject = true;

  src = fetchPypi {
    pname = "MiniMock";
    inherit (finalAttrs) version;
    hash = "sha256-X9/f6t8Px4HQWSobkNL8wRWB9oL/fLpiAc/bFcPqWkw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "minimock" ];

  meta = {
    homepage = "https://pypi.org/project/MiniMock/";
    description = "Minimalistic mocking library";
    license = lib.licenses.mit;
  };
})
