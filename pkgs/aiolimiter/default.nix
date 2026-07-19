{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "aiolimiter";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mjpieters";
    repo = "aiolimiter";
    tag = "v${version}";
    hash = "sha256-wgHR0GzaPXlhL4ErklFqmWNFO49dvd5X5MgyYHVH4Eo=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "aiolimiter" ];

  meta = {
    description = "Implementation of a rate limiter for asyncio";
    homepage = "https://github.com/mjpieters/aiolimiter";
    license = lib.licenses.mit;
  };
}
