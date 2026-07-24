{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "aiofiles";
  version = "25.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Tinche";
    repo = "aiofiles";
    tag = "v${version}";
    hash = "sha256-NBmzoUb2una3+eWqR1HraVPibaRb9I51aYwskrjxskQ=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "aiofiles" ];

  meta = {
    description = "File support for asyncio";
    homepage = "https://github.com/Tinche/aiofiles";
    license = lib.licenses.asl20;
  };
}
