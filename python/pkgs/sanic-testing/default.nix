{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  httpx
, sanic
, websockets
,
}:

buildPythonPackage rec {
  pname = "sanic-testing";
  version = "24.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sanic-org";
    repo = "sanic-testing";
    tag = "v${version}";
    hash = "sha256-biUgxa0sINHAYzyKimVD8+/mPUq2dlnCl2BN+UeUaEo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    httpx
    sanic
    websockets
  ];

  # Tests require circular dependency with sanic
  doCheck = false;

  pythonImportsCheck = [ "sanic_testing" ];

  meta = {
    description = "Core testing clients for the Sanic web framework";
    homepage = "https://github.com/sanic-org/sanic-testing";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
