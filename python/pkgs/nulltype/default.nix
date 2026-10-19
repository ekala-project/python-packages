{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "nulltype";
  version = "2.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0wpjbsmm0c9ifg9y6cnfz49qq9pa5f99nnqp6wdlv42ymfr3rak4";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "nulltype" ];

  meta = {
    description = "Python library to handle Null values and sentinels like (but not) None, False and True";
    homepage = "https://pypi.org/project/nulltype/";
    license = lib.licenses.asl20;
  };
}
