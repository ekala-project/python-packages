{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  jalali-core,
}:

buildPythonPackage rec {
  pname = "jdatetime";
  version = "6.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-40nsX+TNQriObxodnR3iORv6dwKl09POhw1ZOkdVl7A=";
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
