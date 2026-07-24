{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,

  # dependencies
  click,
  pygithub,
  requests,
  terminaltables3,
}:

buildPythonPackage rec {
  pname = "keep";
  version = "2.11";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Brwvu/Zevr8sOE3KAwakDDzVMc2VoFxIb1orXAes2U0=";
  };

  build-system = [ flit-core ];

  dependencies = [
    click
    pygithub
    requests
    terminaltables3
  ];

  pythonImportsCheck = [ "keep" ];

  meta = {
    homepage = "https://github.com/OrkoHunter/keep";
    description = "Meta CLI toolkit to keep personal shell command keeper and manage snippets";
    license = lib.licenses.mit;
    mainProgram = "keep";
  };
}
