{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
}:

buildPythonPackage rec {
  pname = "traitlets";
  version = "5.14.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ipython";
    repo = "traitlets";
    tag = "v${version}";
    hash = "sha256-lWtgzXW1ffzl1jkFaq99X0dU8agulUMHaghsYKX+8Dk=";
  };

  build-system = [ hatchling ];

  meta = {
    description = "Traitlets Python config system";
    homepage = "https://github.com/ipython/traitlets";
    license = lib.licenses.bsd3;
  };
}
