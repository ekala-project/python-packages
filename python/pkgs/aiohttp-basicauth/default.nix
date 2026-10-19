{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  aiohttp,
  setuptools,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "aiohttp-basicauth";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "romis2012";
    repo = "aiohttp-basicauth";
    tag = "v${finalAttrs.version}";
    hash = "sha256-EnrICetTmQimScjaQ8/jviwwansbZtl35Z5v35rF7kU=";
  };

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];
  pythonImportsCheck = [ "aiohttp_basicauth" ];

  meta = {
    description = "HTTP basic authentication middleware for aiohttp 3.0";
    homepage = "https://github.com/romis2012/aiohttp-basicauth";
    license = lib.licenses.asl20;
  };
})
