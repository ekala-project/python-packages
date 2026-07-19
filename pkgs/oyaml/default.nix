{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pyyaml,
}:

buildPythonPackage {
  pname = "oyaml";
  version = "unstable-2021-12-03";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wimglenn";
    repo = "oyaml";
    rev = "d0195070d26bd982f1e4e604bded5510dd035cd7";
    hash = "sha256-1rSEhiULlAweLDqUFX+JBFxe3iW9kNlRA2zjcG8MYSg=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyyaml ];

  pythonImportsCheck = [ "oyaml" ];

  meta = {
    description = "Drop-in replacement for PyYAML which preserves dict ordering";
    homepage = "https://github.com/wimglenn/oyaml";
    license = lib.licenses.mit;
  };
}
