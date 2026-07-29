{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  hatchling
, # dependencies
  typing-extensions
, # optional-dependencies
  fastapi
, httpx
, python-multipart
, starlette
, django
, flask
, werkzeug
, sanic
, aiohttp
, yarl
, quart
, chalice
, litestar
, sanic-testing
,
}:

buildPythonPackage (finalAttrs: {
  pname = "cross-web";
  version = "0.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "usecross";
    repo = "cross-web";
    rev = finalAttrs.version;
    hash = "sha256-JxwzTU17jCQMFNCtmcZVAZQnwDZjHNxCGNdKhkCMoPs=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.0.0"' 'version = "${finalAttrs.version}"'
  '';

  build-system = [ hatchling ];

  dependencies = [ typing-extensions ];

  optional-dependencies = {
    integrations = [
      fastapi
      httpx
      python-multipart
      starlette
      django
      flask
      werkzeug
      sanic
      aiohttp
      yarl
      quart
      chalice
      litestar
      sanic-testing
    ];
  };

  pythonImportsCheck = [ "cross_web" ];

  meta = {
    description = "Universal web framework adapter for Python";
    homepage = "https://github.com/usecross/cross-web";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
