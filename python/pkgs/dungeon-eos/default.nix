{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "dungeon-eos";
  version = "0.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "SkyTemple";
    repo = "dungeon-eos";
    tag = finalAttrs.version;
    hash = "sha256-Z1fGtslXP8zcZmVeWjRrbcM2ZJsfbrWjpLWZ49uSCRY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dungeon_eos" ];

  meta = {
    homepage = "https://github.com/SkyTemple/dungeon-eos";
    description = "Package that simulates PMD EoS dungeon generation";
    license = lib.licenses.gpl3Plus;
  };
})
