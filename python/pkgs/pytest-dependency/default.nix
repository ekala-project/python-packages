{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-dependency";
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_dependency";
    inherit (finalAttrs) version;
    hash = "sha256-JGwk0qX8dDqULOxECIU2QOVqBbpY1G5bITodS3OKJGQ=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  pythonImportsCheck = [ "pytest_dependency" ];

  meta = {
    description = "Manage dependencies of tests";
    homepage = "https://github.com/RKrahl/pytest-dependency";
    license = lib.licenses.asl20;
  };
})
