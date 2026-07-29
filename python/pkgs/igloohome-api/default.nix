{
  aiohttp,
  buildPythonPackage,
  dacite,
  fetchFromGitHub,
  hatchling,
  lib,
  pyjwt,
}:

buildPythonPackage (finalAttrs: {
  pname = "igloohome-api";
  version = "0.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "keithle888";
    repo = "igloohome-api";
    tag = "v${finalAttrs.version}";
    hash = "sha256-BLmmypbvYTgQisT0+9Ym1ZTK6asAP2tWXP2DWhKYM7U=";
  };

  build-system = [ hatchling ];

  dependencies = [
    aiohttp
    dacite
    pyjwt
  ];

  pythonImportsCheck = [ "igloohome_api" ];

  # upstream has no tests
  doCheck = false;

  meta = {
    description = "Python package for using igloohome's API";
    homepage = "https://github.com/keithle888/igloohome-api";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
