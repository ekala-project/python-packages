{
  lib,
  aiofiles,
  buildPythonPackage,
  deprecation,
  fetchFromGitHub,
  httpx,
  jwcrypto,
  poetry-core,
  requests,
  requests-toolbelt,
  freezegun,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-keycloak";
  version = "7.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "marcospereirampj";
    repo = "python-keycloak";
    tag = "v${finalAttrs.version}";
    hash = "sha256-3BrXSktN0OYQJRRZ234z06pGHicJOIBUzSdMd6y95L4=";
  };

  postPatch = ''
    # Upstream doesn't set version
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.0.0"' 'version = "${finalAttrs.version}"'
  '';

  build-system = [ poetry-core ];

  dependencies = [
    aiofiles
    deprecation
    httpx
    jwcrypto
    requests
    requests-toolbelt
  ];
  # conftest.py requires these variables to be set,
  # even if the respective tests are disabled
  pythonImportsCheck = [ "keycloak" ];

  meta = {
    description = "Provides access to the Keycloak API";
    homepage = "https://github.com/marcospereirampj/python-keycloak";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
