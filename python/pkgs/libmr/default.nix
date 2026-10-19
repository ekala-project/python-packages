{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  numpy,
  cython,
}:

buildPythonPackage (finalAttrs: {
  pname = "libmr";
  version = "0.1.9";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    extension = "zip";
    sha256 = "43ccd86693b725fa3abe648c8cdcef17ba5fa46b5528168829e5f9b968dfeb70";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    cython
  ];

  # No tests in the pypi tarball

  meta = {
    description = "LibMR provides core MetaRecognition and Weibull fitting functionality";
    homepage = "https://github.com/Vastlab/libMR";
    license = lib.licenses.bsd3;
  };
})
