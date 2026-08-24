{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  typing-extensions,
  whey,
}:

buildPythonPackage rec {
  pname = "coincidence";
  version = "0.6.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-coincidence";
    repo = "coincidence";
    tag = "v${version}";
    hash = "sha256-ktSuUzAwMych6Y2eJWMUfG1a3mGypg8L20f/105RFXc=";
  };

  build-system = [ whey ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "coincidence" ];

  meta = {
    description = "Helper functions for pytest";
    homepage = "https://github.com/python-coincidence/coincidence";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
