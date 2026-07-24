{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "pdfkit";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mS+CHh4Y/IoOcB7K4ktRotWYKWoYDK7gokwK8YHaAqk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pdfkit" ];

  meta = {
    description = "Wkhtmltopdf python wrapper to convert html to pdf";
    homepage = "https://pypi.org/project/pdfkit/";
    license = lib.licenses.mit;
  };
}
