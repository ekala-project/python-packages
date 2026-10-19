{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "sanic-routing";
  version = "23.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sanic-org";
    repo = "sanic-routing";
    tag = "v${finalAttrs.version}";
    hash = "sha256-IUubPd6mqtCfY4ruI/8wkFcAcS0xXHWbe9RzDac5kRc=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "sanic_routing" ];

  meta = {
    description = "Core routing component for the Sanic web framework";
    homepage = "https://github.com/sanic-org/sanic-routing";
    license = lib.licenses.mit;
  };
})
