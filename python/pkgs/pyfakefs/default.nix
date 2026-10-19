{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyfakefs";
  version = "6.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-5Zo220R79QnOnJerPRUQwIzFGJXFMRMlpWCl5bXcGUA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyfakefs" ];

  meta = {
    description = "Fake file system that mocks the Python file system modules";
    homepage = "https://pyfakefs.org/";
    license = lib.licenses.asl20;
  };
})
