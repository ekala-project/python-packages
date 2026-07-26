{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  cloudpickle,
  farama-notifications,
  numpy,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "gymnasium";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Farama-Foundation";
    repo = "Gymnasium";
    tag = "v${version}";
    hash = "sha256-cXcIELXPbhIvAUUYAU55GJkuD+gXwz5V1Y3J/PBqj1o=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cloudpickle
    farama-notifications
    numpy
    typing-extensions
  ];

  pythonImportsCheck = [ "gymnasium" ];

  doCheck = false;

  meta = {
    description = "Standard API for reinforcement learning and a diverse set of reference environments";
    homepage = "https://github.com/Farama-Foundation/Gymnasium";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
