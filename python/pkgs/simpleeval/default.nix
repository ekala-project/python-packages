{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "simpleeval";
  version = "1.0.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "danthedeckie";
    repo = "simpleeval";
    tag = version;
    hash = "sha256-w3Ukb1W5DV9LVcV4IyraBsaFjOgoOoxzQ62N3BBxk1M=";
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
