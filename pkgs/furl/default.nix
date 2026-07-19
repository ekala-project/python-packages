{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  orderedmultidict,
  six,
}:

buildPythonPackage rec {
  pname = "furl";
  version = "2.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gruns";
    repo = "furl";
    tag = "v${version}";
    hash = "sha256-NRkOJlluZjscM4ZhxHoXIzV2A0+mrkaw7rcxfklGCHs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    orderedmultidict
    six
  ];

  pythonImportsCheck = [ "furl" ];

  meta = {
    description = "Python library that makes parsing and manipulating URLs easy";
    homepage = "https://github.com/gruns/furl";
    license = lib.licenses.unlicense;
  };
}
