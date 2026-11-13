{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "pygobject-stubs";
  version = "2.20.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pygobject";
    repo = "pygobject-stubs";
    tag = "v${finalAttrs.version}";
    hash = "sha256-h+4z2+vUo4KE7NNchMlnDt2GpLUlFdKVLoMoxFgZmP8=";
  };

  build-system = [ setuptools ];

  # PyGObject is not packaged in this package set; the stubs themselves
  # don't need it at build or import time.
  pythonRemoveDeps = [ "PyGObject" ];

  dependencies = [ typing-extensions ];

  # This package does not include any tests.

  meta = {
    description = "PEP 561 Typing Stubs for PyGObject";
    homepage = "https://github.com/pygobject/pygobject-stubs";
    license = lib.licenses.lgpl21Plus;
  };
})
