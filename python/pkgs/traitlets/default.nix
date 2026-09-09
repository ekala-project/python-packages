{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
}:

buildPythonPackage rec {
  pname = "traitlets";
  version = "5.16.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ipython";
    repo = "traitlets";
    tag = "v${version}";
    hash = "sha256-lBVPRZU3fK1ha7tLi0d2wlBcoUVBZS8bjt+c16jDi/c=";
  };

  build-system = [ hatchling ];

  meta = {
    description = "Traitlets Python config system";
    homepage = "https://github.com/ipython/traitlets";
    license = lib.licenses.bsd3;
  };
}
