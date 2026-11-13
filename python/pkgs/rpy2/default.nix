{
  lib,
  buildPythonPackage,
  fetchPypi,
  isPyPy,
  rpy2-rinterface,
  rpy2-robjects,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  version = "3.6.9";
  pyproject = true;
  pname = "rpy2";

  disabled = isPyPy;
  src = fetchPypi {
    inherit (finalAttrs) version pname;
    hash = "sha256-93fiAOh0n3PTT4YEZdvJPYh4MQ1cgn8RFfVHQGu8Qlg=";
  };

  build-system = [ setuptools ];

  # rpy2 is a metapackage; the rinterface/robjects components lag behind
  pythonRelaxDeps = [
    "rpy2-rinterface"
    "rpy2-robjects"
  ];

  dependencies = [
    rpy2-rinterface
    rpy2-robjects
  ];

  pythonImportsCheck = [
    "rpy2"
  ];

  meta = {
    homepage = "https://rpy2.github.io/";
    description = "Python interface to R";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.unix;
  };
})
