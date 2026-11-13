{
  lib,
  buildPythonPackage,
  fetchPypi,
  numpy,
  pytestCheckHook,
  python-utils,
  typing-extensions,
  uv-build,
}:

buildPythonPackage (finalAttrs: {
  pname = "numpy-stl";
  version = "4.1.3";
  pyproject = true;

  src = fetchPypi {
    pname = "numpy_stl";
    inherit (finalAttrs) version;
    hash = "sha256-KCD2S6Yyg7/lYIHzbrkIkZYUHQjrXgDs0bpQznju4Qc=";
  };

  build-system = [ uv-build ];

  dependencies = [
    numpy
    python-utils
    typing-extensions
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "stl" ];

  meta = {
    description = "Library to make reading, writing and modifying both binary and ascii STL files easy";
    homepage = "https://github.com/WoLpH/numpy-stl/";
    license = lib.licenses.bsd3;
  };
})
