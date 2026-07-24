{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  lxml,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "python-docx";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-openxml";
    repo = "python-docx";
    tag = "v${version}";
    hash = "sha256-5x2VmMiY5fZiXoswCDcs89olL0vbpGzmJZThrNS/SmI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    lxml
    typing-extensions
  ];

  pythonImportsCheck = [ "docx" ];

  meta = {
    description = "Create and update Microsoft Word .docx files";
    homepage = "https://python-docx.readthedocs.io/";
    license = lib.licenses.mit;
  };
}
