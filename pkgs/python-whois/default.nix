{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "python_whois";
  version = "0.9.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Lm3nttcOMFqF9IWc0XeB7j8No6AqjpTyPLTNzS5AC/o=";
  };

  build-system = [ setuptools ];

  dependencies = [ python-dateutil ];

  pythonImportsCheck = [ "whois" ];

  meta = {
    description = "Python module to produce parsed WHOIS data";
    homepage = "https://github.com/richardpenman/whois";
    license = lib.licenses.mit;
  };
}
