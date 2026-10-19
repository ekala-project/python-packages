{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "mcuuid";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "clerie";
    repo = "mcuuid";
    tag = finalAttrs.version;
    hash = "sha256-YwM7CdZVXpUXKXUzFL3AtoDhekLDIvZ/q8taLsHihNk=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # upstream code does not provide tests

  pythonImportsCheck = [ "mcuuid" ];

  meta = {
    description = "Getting Minecraft player information from Mojang API";
    homepage = "https://github.com/clerie/mcuuid";
    license = lib.licenses.mit;
  };
})
