{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "batinfo";
  version = "0.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nicolargo";
    repo = "batinfo";
    tag = "v${version}";
    hash = "sha256-GgAJJA8bzQJLAU+nxmkDa5LFTHc4NGi+nj9PfKyw8/M=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "batinfo" ];

  meta = {
    description = "Module to retrieve battery information";
    homepage = "https://github.com/nicolargo/batinfo";
    license = lib.licenses.lgpl3Plus;
    platforms = lib.platforms.linux;
  };
}
