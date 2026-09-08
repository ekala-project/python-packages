{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  lark,
  setuptools-scm,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-hcl2";
  version = "8.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "amplify-education";
    repo = "python-hcl2";
    tag = "v${version}";
    hash = "sha256-hqGl9H0qwqPhBWD/KUkLklMVuUCENdCOWs6QtePloyQ=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ lark ];

  pythonImportsCheck = [ "hcl2" ];
  meta = {
    description = "Parser for HCL2 written in Python using Lark";
    homepage = "https://github.com/amplify-education/python-hcl2";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
