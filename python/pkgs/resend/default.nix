{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  requests,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "resend";
  version = "2.41.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "resend";
    repo = "resend-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-SPXQ3RArBCiFrO1TY5Dlf7lFG/QgfNE9cjbwMMYg/iw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    typing-extensions
  ];

  pythonImportsCheck = [ "resend" ];

  meta = {
    description = "SDK for Resend";
    homepage = "https://github.com/resend/resend-python";
    changelog = "https://github.com/resend/resend-python/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.mit;
  };
})
