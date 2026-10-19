{
  lib,
  buildPythonPackage,
  cssutils,
  cython,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "tinycss";
  version = "0.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-EjBvtQ5enn6u74S4Au2HdIi6gONcZyhn9UjAkkp2cW4=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    sed -i "/--cov/d" setup.cfg
  '';

  nativeBuildInputs = [ cython ];

  dependencies = [ cssutils ];

  preBuild = ''
    # Force Cython to re-generate this file. If it is present, Cython will
    # think it is "up to date" even though it was generated with an older,
    # incompatible version of Cython. See
    # https://github.com/Kozea/tinycss/issues/17.
    rm tinycss/speedups.c
  '';

  # Disable Cython tests
  env.TINYCSS_SKIP_SPEEDUPS_TESTS = true;

  pythonImportsCheck = [ "tinycss" ];

  meta = {
    description = "Complete yet simple CSS parser for Python";
    homepage = "https://tinycss.readthedocs.io";
    license = lib.licenses.bsd3;
  };
})
