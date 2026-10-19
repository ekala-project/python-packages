{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  jinja2,
  pygments,
  markupsafe,
  nix-update-script,
  markdown2,
  pydantic,
}:

buildPythonPackage (finalAttrs: {
  pname = "pdoc";
  version = "16.0.0";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "mitmproxy";
    repo = "pdoc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-9amp6CWYIcniVfdlmPKYuRFR7B5JJtuMlOoDxpfvvJA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    jinja2
    pygments
    markupsafe
    markdown2
    pydantic
  ];

  disabledTestMarks = [
    "slow" # skip slow tests
  ];

  pythonImportsCheck = [ "pdoc" ];

  passthru.updateScript = nix-update-script { };

  meta = {
    homepage = "https://pdoc.dev/";
    description = "API Documentation for Python Projects";
    mainProgram = "pdoc";
    license = lib.licenses.unlicense;
  };
})
