{
  aiofiles,
  aiohttp,
  aioresponses,
  buildPythonPackage,
  fetchFromGitHub,
  isodate,
  lib,
  pytest-asyncio,
  pytestCheckHook,
  python-dotenv,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "cookidoo-api";
  version = "0.18.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "miaucl";
    repo = "cookidoo-api";
    tag = finalAttrs.version;
    hash = "sha256-db/p0NMg98cNGO/9sGA1/M5Au6z/1oyeLKenNoI9QNM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiofiles
    aiohttp
    isodate
  ];

  pythonImportsCheck = [ "cookidoo_api" ];

  nativeCheckInputs = [
    aioresponses
    pytest-asyncio
    pytestCheckHook
    python-dotenv
  ];

  meta = {
    description = "Unofficial package to access Cookidoo";
    homepage = "https://github.com/miaucl/cookidoo-api";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
