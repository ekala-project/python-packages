{
  appdirs,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  importlib-resources,
  lib,
  pyserial,
  pytestCheckHook,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "heatmiserv3";
  version = "3.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "andylockran";
    repo = "heatmiserV3";
    tag = finalAttrs.version;
    hash = "sha256-crpiSlRSEZBmzsQabEuuJqPpFr/+FTykcZcbSVI2n1M=";
  };

  build-system = [ hatchling ];

  pythonRelaxDeps = [ "importlib-resources" ];

  dependencies = [
    appdirs
    importlib-resources
    pyserial
    pyyaml
  ];

  pythonImportsCheck = [ "heatmiserv3" ];

  nativeCheckInputs = [ pytestCheckHook ];

  meta = {
    description = "Library to interact with Heatmiser Themostats using V3 protocol";
    homepage = "https://github.com/andylockran/heatmiserV3";
    license = lib.licenses.mit;
  };
})
