{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  arabic-reshaper,
  html5lib,
  pillow,
  pyhanko,
  pyhanko-certvalidator,
  pypdf,
  python-bidi,
  reportlab,
  setuptools,
  svglib,
}:

buildPythonPackage rec {
  pname = "xhtml2pdf";
  version = "0.2.17";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "xhtml2pdf";
    repo = "xhtml2pdf";
    tag = "v${version}";
    hash = "sha256-qp0JVp5efIrI98YT0rwFAMSEW+0aIhedfYGND4V7Mto=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "reportlab" ];

  dependencies = [
    arabic-reshaper
    html5lib
    pillow
    pyhanko
    pyhanko-certvalidator
    pypdf
    python-bidi
    reportlab
    svglib
  ];

  pythonImportsCheck = [
    "xhtml2pdf"
    "xhtml2pdf.pisa"
  ];

  meta = {
    description = "PDF generator using HTML and CSS";
    homepage = "https://github.com/xhtml2pdf/xhtml2pdf";
    license = lib.licenses.asl20;
    mainProgram = "xhtml2pdf";
    maintainers = [ ];
  };
}
