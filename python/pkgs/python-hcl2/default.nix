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
  version = "7.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "amplify-education";
    repo = "python-hcl2";
    tag = "v${version}";
    hash = "sha256-aHaDZvgpiINUEdSYlUVwa0l80mujb9F04eboAdiuzDc=";
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
