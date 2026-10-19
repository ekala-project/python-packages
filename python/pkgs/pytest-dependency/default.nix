{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-dependency";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-k0sOajnZWZUGLBk/fq7tio/6Bv8bzvS2Kw3HSnCLrME=";
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
