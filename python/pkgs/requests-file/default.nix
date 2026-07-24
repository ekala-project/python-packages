{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  requests,
}:

buildPythonPackage rec {
  pname = "requests-file";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dashea";
    repo = "requests-file";
    tag = version;
    hash = "sha256-JtdtE44yiw2mLMZ0bJv0QiGWb7f8ywPLF7+BUufh/g4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "requests_file" ];

  meta = {
    description = "Transport adapter for fetching file:// URLs with the requests python library";
    homepage = "https://github.com/dashea/requests-file";
    license = lib.licenses.asl20;
  };
}
