{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  requests,
}:

buildPythonPackage rec {
  pname = "mcuuid";
  version = "1.1.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "clerie";
    repo = "mcuuid";
    tag = version;
    hash = "sha256-YwM7CdZVXpUXKXUzFL3AtoDhekLDIvZ/q8taLsHihNk=";
  };

  dependencies = [ requests ];

  # upstream code does not provide tests

  pythonImportsCheck = [ "mcuuid" ];

  meta = {
    description = "Getting Minecraft player information from Mojang API";
    homepage = "https://github.com/clerie/mcuuid";
    license = lib.licenses.mit;
  };
}
