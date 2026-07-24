{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  google-auth,
  requests-oauthlib,
  click,
}:

buildPythonPackage (finalAttrs: {
  pname = "google-auth-oauthlib";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "google-cloud-python";
    tag = "google-auth-oauthlib-v${finalAttrs.version}";
    hash = "sha256-KJviH4dofYSvZu9S7VMBSnGjH66xMUEvhcmZN7GJ4Iw=";
  };

  sourceRoot = "${finalAttrs.src.name}/packages/google-auth-oauthlib";

  build-system = [ setuptools ];

  dependencies = [
    google-auth
    requests-oauthlib
  ];

  optional-dependencies = {
    tool = [ click ];
  };

  pythonImportsCheck = [ "google_auth_oauthlib" ];

  meta = {
    description = "Google Authentication Library: oauthlib integration";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-auth-oauthlib";
    license = lib.licenses.asl20;
    mainProgram = "google-oauthlib-tool";
  };
})
