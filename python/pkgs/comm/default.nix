{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  traitlets,
}:

buildPythonPackage rec {
  pname = "comm";
  version = "0.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ipython";
    repo = "comm";
    tag = "v${version}";
    hash = "sha256-gDggPu2h43lGyovTND9a3o9F2hWppV5uvAJa78JxJCo=";
  };

  build-system = [ hatchling ];

  dependencies = [ traitlets ];

  meta = {
    description = "Jupyter Python Comm implementation, for usage in ipykernel, xeus-python etc";
    homepage = "https://github.com/ipython/comm";
    license = lib.licenses.bsd3;
  };
}
