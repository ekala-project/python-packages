{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  sgmllib3k,
}:

buildPythonPackage rec {
  pname = "feedparser";
  version = "6.0.12";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZPds6Qrj6O9dHt4PjTtQzia8znHdiuXoKxzS1KX5Qig=";
  };

  build-system = [ setuptools ];

  dependencies = [ sgmllib3k ];

  pythonImportsCheck = [ "feedparser" ];

  meta = {
    description = "Universal feed parser";
    homepage = "https://github.com/kurtmckee/feedparser";
    license = lib.licenses.bsd2;
  };
}
