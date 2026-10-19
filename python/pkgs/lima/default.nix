{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytestCheckHook,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "lima";
  version = "0.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-OxBBmzZGM+PtpSw5ixIMVH/Z1YVOTO/ZvPecPAoAEmM=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "lima" ];

  meta = {
    description = "Lightweight Marshalling of Python Objects";
    homepage = "https://github.com/b6d/lima";
    license = lib.licenses.mit;
  };
})
