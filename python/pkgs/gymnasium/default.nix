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
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Farama-Foundation";
    repo = "Gymnasium";
    tag = "v${finalAttrs.version}";
    hash = "sha256-RrAGkHogVizEnkbKG2rVXRIBJEOPd9U2n/XG2qZ5HR4=";
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
