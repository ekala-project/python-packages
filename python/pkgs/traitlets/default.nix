{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
}:

buildPythonPackage rec {
  pname = "traitlets";
  version = "5.15.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ipython";
    repo = "traitlets";
    tag = "v${version}";
    hash = "sha256-c4OZSC2MrX6Jx8x49lOzlkgwpwz+/2l+GGVCzpO/P+8=";
  };

  build-system = [ hatchling ];

  meta = {
    description = "Traitlets Python config system";
    homepage = "https://github.com/ipython/traitlets";
    license = lib.licenses.bsd3;
  };
}
