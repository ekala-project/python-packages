{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
  numpy,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "minexr";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cheind";
    repo = "py-minexr";
    tag = finalAttrs.version;
    hash = "sha256-p42rlhaHq0A9+zk6c0evRDjNR1H/ruWJqPF5+nCTR8o=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  pythonImportsCheck = [ "minexr" ];
  nativeCheckInputs = [
    pytestCheckHook
    pillow
  ];

  meta = {
    description = "Minimal, standalone OpenEXR reader for single-part, uncompressed scan line files";
    homepage = "https://github.com/cheind/py-minexr";
    license = lib.licenses.mit;
  };
})
