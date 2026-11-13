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

buildPythonPackage (finalAttrs: {
  pname = "svglib";
  version = "2.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-kPWGKMp+bUi0D2OK0Nq0cvKZT4I+szpiPI+ijkNM5XQ=";
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
})
