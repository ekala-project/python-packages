{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "xlrd";
  version = "2.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-CLXiXeWPIc5x3H2zs7gQbB+ndvMCTFTkW0WzdOiSNMk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "xlrd" ];

  meta = {
    homepage = "https://www.python-excel.org/";
    description = "Library for developers to extract data from Microsoft Excel (tm) spreadsheet files";
    mainProgram = "runxlrd.py";
    license = lib.licenses.bsd0;
  };
}
