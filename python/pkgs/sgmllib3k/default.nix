{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sgmllib3k";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eGj7HIv6dkwaxWPTzzacOB0TJdNhJJM6cm8p/NqoEuk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "sgmllib" ];

  meta = {
    description = "Python 3 port of sgmllib";
    homepage = "https://pypi.org/project/sgmllib3k/";
    license = lib.licenses.bsd2;
  };
}
