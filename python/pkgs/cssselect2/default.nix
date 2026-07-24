{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  tinycss2,
  webencodings,
}:

buildPythonPackage rec {
  pname = "cssselect2";
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dZqiLCFjJjVvZeYueR1mFgoPnJHRQk6NitxedN3fxvs=";
  };

  build-system = [ flit-core ];

  dependencies = [
    tinycss2
    webencodings
  ];

  doCheck = false;

  pythonImportsCheck = [ "cssselect2" ];

  meta = {
    description = "CSS selectors for Python ElementTree";
    homepage = "https://github.com/Kozea/cssselect2";
    license = lib.licenses.bsd3;
  };
}
