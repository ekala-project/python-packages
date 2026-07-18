{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "hsaudiotag3k";
  version = "1.1.3.post1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-72DpIQ1HJ+gvAJWmhssHtnbQVZGPDFnFv6hZjaA+WdE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "hsaudiotag" ];

  meta = {
    description = "Pure Python library that lets one to read metadata from media files";
    homepage = "http://hg.hardcoded.net/hsaudiotag/";
    license = lib.licenses.bsd3;
  };
}
