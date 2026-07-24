{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  setuptools,

  # tests
}:

buildPythonPackage (finalAttrs: {
  pname = "reedsolo";
  version = "1.7.0";
  pyproject = true;

  # Pypi does not have the tests
  src = fetchFromGitHub {
    owner = "tomerfiliba";
    repo = "reedsolomon";
    tag = "v${finalAttrs.version}";
    hash = "sha256-nzdD1oGXHSeGDD/3PpQQEZYGAwn9ahD2KNYGqpgADh0=";
  };

  nativeBuildInputs = [
    cython
    setuptools
  ];
  meta = {
    description = "Pure-python universal errors-and-erasures Reed-Solomon Codec";
    homepage = "https://github.com/tomerfiliba/reedsolomon";
    license = lib.licenses.publicDomain;
    maintainers = [ ];
  };
})
