{
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  lxml,
  pillow,
  reportlab,
  lib,
}:
buildPythonPackage (finalAttrs: {
  pname = "hocr-tools";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ocropus";
    repo = "hocr-tools";
    tag = "v${finalAttrs.version}";
    sha256 = "14f9hkp7pr677085w8iidwd0la9cjzy3pyj3rdg9b03nz9pc0w6p";
  };

  build-system = [ setuptools ];

  # hocr-tools uses a test framework that requires internet access

  dependencies = [
    pillow
    lxml
    reportlab
  ];

  meta = {
    description = "Tools for manipulating and evaluating the hOCR format for representing multi-lingual OCR results by embedding them into HTML";
    homepage = "https://github.com/ocropus/hocr-tools";
    license = lib.licenses.asl20;
  };
})
