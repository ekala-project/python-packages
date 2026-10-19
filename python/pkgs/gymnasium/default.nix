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

buildPythonPackage (finalAttrs: {
  pname = "gymnasium";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Farama-Foundation";
    repo = "Gymnasium";
    tag = "v${finalAttrs.version}";
    hash = "sha256-asQ/RqnmGRoVdwBkp4RIkqzGtQ7PnISt8/mRcXrNbBc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cloudpickle
    farama-notifications
    numpy
    typing-extensions
  ];

  pythonImportsCheck = [ "gymnasium" ];

  meta = {
    description = "Standard API for reinforcement learning and a diverse set of reference environments";
    homepage = "https://github.com/Farama-Foundation/Gymnasium";
    license = lib.licenses.mit;
  };
})
