{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-fancy-pypi-readme,
  hatchling,
  httpx,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "httpx-retries";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "will-ockmore";
    repo = "httpx-retries";
    tag = finalAttrs.version;
    hash = "sha256-9AQqyveBAqD159J1VhIhp8GrZJLQhJ22A5cFjpaa7o0=";
  };

  build-system = [
    hatch-fancy-pypi-readme
    hatchling
  ];

  dependencies = [ httpx ];
  pythonImportsCheck = [ "httpx_retries" ];

  meta = {
    description = "Retry layer for HTTPX";
    homepage = "https://github.com/will-ockmore/httpx-retries";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
