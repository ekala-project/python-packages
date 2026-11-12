{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest,
  pytest-regressions,
  typing-extensions,
  whey,
}:

buildPythonPackage (finalAttrs: {
  pname = "coincidence";
  version = "0.6.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-coincidence";
    repo = "coincidence";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ktSuUzAwMych6Y2eJWMUfG1a3mGypg8L20f/105RFXc=";
  };

  build-system = [ whey ];

  buildInputs = [ pytest ];

  dependencies = [
    pytest-regressions
    typing-extensions
  ];

  pythonImportsCheck = [ "coincidence" ];

  meta = {
    description = "Helper functions for pytest";
    homepage = "https://github.com/python-coincidence/coincidence";
    license = lib.licenses.mit;
  };
})
