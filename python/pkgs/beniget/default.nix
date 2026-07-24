{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  gast,
}:

buildPythonPackage rec {
  pname = "beniget";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-568R+o7H3j0+s9mLHnItFdRAF9izXYqhHVT2cZsxLyI=";
  };

  build-system = [ setuptools ];

  dependencies = [ gast ];

  doCheck = false;

  pythonImportsCheck = [ "beniget" ];

  meta = {
    description = "Extract semantic information about static Python code";
    homepage = "https://github.com/serge-sans-paille/beniget";
    license = lib.licenses.bsd3;
  };
}
