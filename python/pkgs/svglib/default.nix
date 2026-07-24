{
  lib,
  buildPythonPackage,
  fetchPypi,
  cssselect2,
  lxml,
  pillow,
  reportlab,
  tinycss2,
}:

buildPythonPackage rec {
  pname = "svglib";
  version = "1.5.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Oudl06lAnuYMD7TSTC3raoBheqknBU9bzX/JjwaV5Yc=";
  };

  propagatedBuildInputs = [
    cssselect2
    lxml
    pillow
    reportlab
    tinycss2
  ];
  pythonImportsCheck = [ "svglib.svglib" ];

  meta = {
    description = "Pure-Python library for reading and converting SVG";
    mainProgram = "svg2pdf";
    homepage = "https://github.com/deeplook/svglib";
    license = lib.licenses.lgpl3Only;
    maintainers = [ ];
  };
}
