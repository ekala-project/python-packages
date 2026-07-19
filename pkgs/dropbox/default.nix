{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  requests,
  stone,
}:

buildPythonPackage rec {
  pname = "dropbox";
  version = "12.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FQ6oaYFy5LTbVM0r3hnc6iuEi3dsIfum5RE0iRHwh3A=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    stone
  ];

  pythonImportsCheck = [ "dropbox" ];

  meta = {
    homepage = "https://github.com/dropbox/dropbox-sdk-python";
    description = "Python library for Dropbox's HTTP-based Core and Datastore APIs";
    license = lib.licenses.mit;
  };
}
