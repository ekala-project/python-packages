{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pyrate-limiter,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "requests-ratelimiter";
  version = "0.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "JWCook";
    repo = "requests-ratelimiter";
    tag = "v${finalAttrs.version}";
    hash = "sha256-P6tDx/jzGEyFC10WIyHQZIFMSEmtMnHjl+jEih987j8=";
  };

  build-system = [ hatchling ];

  dependencies = [
    pyrate-limiter
    requests
  ];

  pythonImportsCheck = [ "requests_ratelimiter" ];

  meta = {
    description = "Module for rate-limiting for requests";
    homepage = "https://github.com/JWCook/requests-ratelimiter";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
