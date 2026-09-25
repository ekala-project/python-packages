{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "filelock";
  version = "3.32.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tox-dev";
    repo = "filelock";
    tag = finalAttrs.version;
    hash = "sha256-FURGOqWamD7QnXL72nIE/1MKlf485d9TP0wr/hlmohU=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];
  pythonImportsCheck = [ "filelock" ];
  meta = {
    description = "Platform independent file lock for Python";
    homepage = "https://github.com/benediktschmitt/py-filelock";
    license = lib.licenses.mit;
  };
})
