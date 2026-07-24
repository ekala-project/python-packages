{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  attrs,
  flake8,
  hypothesis,
  hypothesmith,
  setuptools,
}:

buildPythonPackage rec {
  pname = "flake8-bugbear";
  version = "25.11.29";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "flake8-bugbear";
    tag = version;
    hash = "sha256-aIcLCUUiXVzt9aDllXmm0TqIDxwTa3zcs6Yc2H5LnWY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    attrs
    flake8
  ];
  pythonImportsCheck = [ "bugbear" ];

  meta = {
    description = "Plugin for Flake8 to find bugs and design problems";
    homepage = "https://github.com/PyCQA/flake8-bugbear";
    longDescription = ''
      A plugin for flake8 finding likely bugs and design problems in your
      program.
    '';
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
