{
  lib,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-dotenv";
  version = "1.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "theskumar";
    repo = "python-dotenv";
    tag = "v${version}";
    hash = "sha256-SfLmKAvMRbeNJOwTYiPf4dAXLxXLnwkDIRex4hai0j0=";
  };

  build-system = [ setuptools ];

  optional-dependencies.cli = [ click ];

  pythonImportsCheck = [ "dotenv" ];

  meta = {
    description = "Add .env support to your django/flask apps in development and deployments";
    mainProgram = "dotenv";
    homepage = "https://github.com/theskumar/python-dotenv";
    license = lib.licenses.bsdOriginal;
  };
}
