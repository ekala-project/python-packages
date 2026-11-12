{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # Build system
  setuptools,

  # Dependencies
  pyyaml,

  # Test dependencies
  sanic-testing,
  attrs,
  coverage,
  msgspec,
  pydantic,
  pytest,
  pytest-cov-stub,
  pytest-asyncio,
  tox,
  jinja2,
  sanic,
}:

buildPythonPackage (finalAttrs: {
  pname = "sanic-ext";
  version = "25.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sanic-org";
    repo = "sanic-ext";
    tag = "v${finalAttrs.version}";
    hash = "sha256-h1yN5VYFPFUZoeZeJ6+CfGE3m/5zz+/G3BbetDKtZAo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    sanic
    pyyaml
    # sanic_ext/extras/validation/clean.py imports pydantic unconditionally
    pydantic
  ];
  pythonImportsCheck = [ "sanic_ext" ];

  meta = {
    description = "Common, officially supported extension plugins for the Sanic web server framework";
    homepage = "https://github.com/sanic-org/sanic-ext/";
    license = lib.licenses.mit;
  };
})
