{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyaes";
  version = "1.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AsGxQFw408NwsIX7lS3YvqP63O5kEa2Z8xLMEpxTbY8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyaes" ];

  meta = {
    description = "Pure-Python AES";
    homepage = "https://github.com/ricmoo/pyaes";
    license = lib.licenses.mit;
  };
}
