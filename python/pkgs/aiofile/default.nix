{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  caio,
}:

buildPythonPackage rec {
  pname = "aiofile";
  version = "3.12.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mosquito";
    repo = "aiofile";
    tag = version;
    hash = "sha256-Y79LGiPsaPxQLOCmH+MGXBcPUL+XWGje0RgYljKW11U=";
  };

  build-system = [ hatchling ];

  pythonRelaxDeps = [ "caio" ];

  dependencies = [ caio ];

  pythonImportsCheck = [ "aiofile" ];

  meta = {
    description = "File operations with asyncio support";
    homepage = "https://github.com/mosquito/aiofile";
    license = lib.licenses.asl20;
  };
}
