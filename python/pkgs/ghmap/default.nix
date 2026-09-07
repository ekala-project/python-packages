{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  tqdm,
  pytest,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "ghmap";
  version = "2.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sgl-umons";
    repo = "ghmap";
    tag = "v${finalAttrs.version}";
    hash = "sha256-GRbdTNW61v8ADnVSFrmfCKWl096VkANz2e2nIL9jGcU=";
  };

  build-system = [
    setuptools
  ];

  pythonRelaxDeps = [
    "tqdm"
  ];

  dependencies = [
    pytest
    tqdm
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [
    "ghmap"
  ];

  meta = {
    description = "A Python tool for mapping GitHub events to contributor activities";
    homepage = "https://github.com/sgl-umons/ghmap";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
