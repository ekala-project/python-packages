{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  html5lib,
  unittestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "microdata";
  version = "0.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "edsu";
    repo = "microdata";
    tag = "v${finalAttrs.version}";
    hash = "sha256-BAygCLBLxZ033ZWRFSR52dSM2nPY8jXplDXQ8WW3KPo=";
  };

  build-system = [ setuptools ];

  dependencies = [ html5lib ];

  nativeCheckInputs = [ unittestCheckHook ];

  pythonImportsCheck = [ "microdata" ];

  meta = {
    description = "Library for extracting html microdata";
    mainProgram = "microdata";
    homepage = "https://github.com/edsu/microdata";
    license = lib.licenses.cc0;
  };
})
