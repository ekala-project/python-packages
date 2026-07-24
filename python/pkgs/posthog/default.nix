{
  lib,
  anthropic,
  backoff,
  buildPythonPackage,
  distro,
  fetchFromGitHub,
  freezegun,
  mock,
  monotonic,
  openai,
  parameterized,
  pytest-asyncio,
  python-dateutil,
  pythonAtLeast,
  requests,
  setuptools,
  six,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "posthog";
  version = "7.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PostHog";
    repo = "posthog-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-GmwFI23HUp9/p6o+UFCES7WwvnexrBrVTDhLd/YYWOs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    backoff
    distro
    monotonic
    python-dateutil
    requests
    six
    typing-extensions
  ];
  pythonImportsCheck = [ "posthog" ];
  meta = {
    description = "Module for interacting with PostHog";
    homepage = "https://github.com/PostHog/posthog-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
