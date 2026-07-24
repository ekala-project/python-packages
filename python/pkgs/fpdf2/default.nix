{
  lib,
  buildPythonPackage,
  defusedxml,
  fetchFromGitHub,
  fonttools,
  pillow,
  setuptools,
}:

buildPythonPackage rec {
  pname = "fpdf2";
  version = "2.8.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "py-pdf";
    repo = "fpdf2";
    tag = version;
    hash = "sha256-LQZ7OMfL+PFxEc7q/dSw+YJoKr+eYEaZF8XCzd7AdBI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    defusedxml
    fonttools
    pillow
  ];
  meta = {
    homepage = "https://github.com/py-pdf/fpdf2";
    description = "Simple PDF generation for Python";
    license = lib.licenses.lgpl3Only;
    maintainers = [ ];
  };
}
