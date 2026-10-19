{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  anyio,

  # optional dependencies
  itsdangerous,
  jinja2,
  python-multipart,
  pyyaml,
  httpx,
}:

buildPythonPackage (finalAttrs: {
  pname = "starlette";
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "encode";
    repo = "starlette";
    tag = finalAttrs.version;
    hash = "sha256-Cp6wkRxbDdC+Yf3z4TvRF5xrchJ+PAo36qHbBg+FcXw=";
  };

  build-system = [ hatchling ];

  dependencies = [ anyio ];

  optional-dependencies.full = [
    itsdangerous
    jinja2
    python-multipart
    pyyaml
    httpx
  ];

  pythonImportsCheck = [ "starlette" ];

  meta = {
    downloadPage = "https://github.com/encode/starlette";
    homepage = "https://www.starlette.io/";
    description = "Little ASGI framework that shines";
    license = lib.licenses.bsd3;
  };
})
