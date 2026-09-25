{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  cssselect2,
  lxml,
  pillow,
  reportlab,
  tinycss2,
}:

buildPythonPackage rec {
  pname = "svglib";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-veXF+bDgkfHiELiq/doHpJvY6/IcDpDWc4OmZcg1l6w=";
  };

  build-system = [ hatchling ];

  dependencies = [
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
  };
}
