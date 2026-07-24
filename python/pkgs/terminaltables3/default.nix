{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,
}:

buildPythonPackage rec {
  pname = "terminaltables3";
  version = "4.0.0-unstable-2024-07-21";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "matthewdeanmartin";
    repo = "terminaltables3";
    rev = "f1c465b36eb9b91a984d8864b21376e7c37075b8";
    hash = "sha256-UcEovh1Eb4QNPwLGDjCphPlJSSkOdhCJ2fK3tuSWOTc=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "terminaltables3" ];

  meta = {
    homepage = "https://github.com/matthewdeanmartin/terminaltables3";
    description = "Generate simple tables in terminals from a nested list of strings";
    license = lib.licenses.mit;
  };
}
