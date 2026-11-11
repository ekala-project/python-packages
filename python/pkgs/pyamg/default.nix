{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  # build-system
  meson-python,
  numpy,
  pybind11,
  versioningit,
  # dependencies
  scipy,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyamg";
  version = "5.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-tYKc45aHZVzmjbRBXJPuFxBWu05B57eY705un5+Tvq4=";
  };

  build-system = [
    meson-python
    numpy
    pybind11
    versioningit
  ];

  dependencies = [
    numpy
    scipy
  ];

  pythonImportsCheck = [
    "pyamg"
    "pyamg.amg_core.evolution_strength"
  ];

  meta = {
    description = "Algebraic Multigrid Solvers in Python";
    homepage = "https://github.com/pyamg/pyamg";
    changelog = "https://github.com/pyamg/pyamg/blob/v${finalAttrs.version}/changelog.md";
    license = lib.licenses.mit;
    broken = stdenv.hostPlatform.isDarwin && lib.versionAtLeast python.version "3.14";
  };
})
