{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  versioneer,
  rnc2rng,
  lxml,
}:

buildPythonPackage (finalAttrs: {
  pname = "citeproc-py";
  version = "0.12.1";
  pyproject = true;

  src = fetchPypi {
    pname = "citeproc_py";
    inherit (finalAttrs) version;
    hash = "sha256-SXxiannnOMzrBuYUTSFtEggUZJ19AcFX+9voNxSfRZk=";
  };

  build-system = [
    setuptools
    versioneer
    rnc2rng
  ];

  dependencies = [ lxml ];

  pythonImportsCheck = [ "citeproc" ];

  meta = {
    description = "Citation Style Language (CSL) parser for Python";
    homepage = "https://github.com/citeproc-py/citeproc-py";
    license = lib.licenses.bsd2;
  };
})
