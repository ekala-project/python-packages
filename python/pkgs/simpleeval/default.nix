{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "simpleeval";
  version = "1.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "danthedeckie";
    repo = "simpleeval";
    tag = version;
    hash = "sha256-+YSPRaX4kulUgPeKspCvJn29iFTfrPTbmWi6pSe7LSw=";
  };

  build-system = [ hatchling ];
  pythonImportsCheck = [ "simpleeval" ];

  meta = {
    description = "Simple, safe single expression evaluator library";
    homepage = "https://github.com/danthedeckie/simpleeval";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
