{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  aiohttp,
}:

buildPythonPackage rec {
  pname = "emulated-roku";
  version = "0.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mindigmarton";
    repo = "emulated_roku";
    tag = version;
    hash = "sha256-KwDEajkrEEgobORetM/rROMDLZvw9AJmmr1jmXAJJbk=";
  };

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];

  # no tests implemented
  doCheck = false;

  pythonImportsCheck = [ "emulated_roku" ];

  meta = {
    description = "Library to emulate a roku server to serve as a proxy for remotes such as Harmony";
    homepage = "https://github.com/mindigmarton/emulated_roku";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
