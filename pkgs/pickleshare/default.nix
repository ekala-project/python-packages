{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pickleshare";
  version = "0.7.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-h2g9R5ZcHaZc2srzHIRB0SuARM3smspQDNePwsaDr8o=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "pickleshare" ];

  meta = {
    homepage = "https://github.com/vivainio/pickleshare";
    description = "Tiny 'shelve'-like database with concurrency support";
    license = lib.licenses.mit;
  };
}
