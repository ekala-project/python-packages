{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  caio,
}:

buildPythonPackage rec {
  pname = "aiofile";
  version = "3.8.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mosquito";
    repo = "aiofile";
    tag = version;
    hash = "sha256-KBly/aeHHZh7mL8MJ9gmxbqS7PmR4sedtBY/2HCXt54=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "caio" ];

  dependencies = [ caio ];

  pythonImportsCheck = [ "aiofile" ];

  meta = {
    description = "File operations with asyncio support";
    homepage = "https://github.com/mosquito/aiofile";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
