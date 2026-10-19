{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  versioningit,
  wheel,
  numpy,
  matplotlib,
  schema,
  hypothesis,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "broadbean";
  version = "0.14.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-v+Ov6mlSnaJG98ooA9AhPGJflrFafKQoO5wi+PxcZVw=";
  };

  nativeBuildInputs = [
    setuptools
    versioningit
    wheel
  ];

  dependencies = [
    numpy
    matplotlib
    schema
  ];

  nativeCheckInputs = [
    hypothesis
    pytestCheckHook
  ];

  disabledTests = [
    # on a 200ms deadline
    "test_points"
  ];

  pythonImportsCheck = [ "broadbean" ];

  meta = {
    homepage = "https://qcodes.github.io/broadbean";
    description = "Library for making pulses that can be leveraged with QCoDeS";
    license = lib.licenses.mit;
  };
})
