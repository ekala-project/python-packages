{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "authres";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-k9G5la184h5i22SfNhBIEl3WAiVjoK6KI5CUZfH9Jbc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "authres" ];

  meta = {
    description = "Authentication-Results header generation and parsing";
    homepage = "https://launchpad.net/authentication-results-python";
    license = lib.licenses.bsd3;
  };
})
