{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  jalali-core,
}:

buildPythonPackage rec {
  pname = "jdatetime";
  version = "6.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5YEtfr9MZgmlVCMMwH3vyJ2cETQkNQ/i1bftfcUNMJc=";
  };

  build-system = [ setuptools ];

  dependencies = [ jalali-core ];

  pythonImportsCheck = [ "jdatetime" ];

  meta = {
    description = "Jalali datetime binding";
    homepage = "https://github.com/slashmili/python-jalali";
    license = lib.licenses.psfl;
  };
}
