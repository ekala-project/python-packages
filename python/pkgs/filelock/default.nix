{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "filelock";
  version = "3.29.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tox-dev";
    repo = "filelock";
    tag = finalAttrs.version;
    hash = "sha256-sRJQa7vmMf9aWXT5QdYAZQHM0oIFFZM9P2tQ2x5T79Y=";
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
    maintainers = [ ];
  };
})
