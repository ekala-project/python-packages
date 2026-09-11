{
  lib,
  aiofiles,
  buildPythonPackage,
  colorama,
  fetchFromGitHub,
  git,
  hatchling,
  jsonschema,
  pytest-gitconfig,
}:

buildPythonPackage rec {
  pname = "griffe";
  version = "1.15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mkdocstrings";
    repo = "griffe";
    tag = version;
    hash = "sha256-AMMTAqsJfj2MltTgAxfvjUTVzi+ZFmx+J9pzhMp28Z4=";
  };

  build-system = [ hatchling ];

  dependencies = [ colorama ];
  optional-dependencies = {
    async = [ aiofiles ];
  };

  pythonImportsCheck = [ "griffe" ];
  meta = {
    description = "Signatures for entire Python programs";
    homepage = "https://github.com/mkdocstrings/griffe";
    license = lib.licenses.isc;
    maintainers = [ ];
    mainProgram = "griffe";
  };
}
