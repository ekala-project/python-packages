{
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  jax,
  jaxlib,
  lib,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "jmp";
  version = "0.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "deepmind";
    repo = "jmp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+PefZU1209vvf1SfF8DXiTvKYEnZ4y8iiIr8yKikx9Y=";
  };

  build-system = [ setuptools ];

  # Wheel requires only `numpy`, but the import needs `jax`.
  dependencies = [ jax ];

  pythonImportsCheck = [ "jmp" ];

  nativeCheckInputs = [
    jaxlib
    pytestCheckHook
  ];

  meta = {
    description = "This library implements support for mixed precision training in JAX";
    homepage = "https://github.com/deepmind/jmp";
    license = lib.licenses.asl20;
  };
})
