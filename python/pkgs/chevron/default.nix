{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "chevron";
  version = "0.14.0-unstable-2021-03-21";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "noahmorrison";
    repo = "chevron";
    rev = "5e1c12827b7fc3db30cb3b24cae9a7ee3092822b";
    hash = "sha256-44cxkliJJ+IozmhS4ekbb+pCa7tcUuX9tRNYTK0mC+w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "chevron" ];

  meta = {
    description = "Python implementation of the mustache templating language";
    homepage = "https://github.com/noahmorrison/chevron";
    license = lib.licenses.mit;
  };
}
