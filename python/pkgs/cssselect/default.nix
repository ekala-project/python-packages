{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "cssselect";
  version = "1.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-jIOnE56XuTql69wPRueF9wVqCKi/IB5ZemomKdfrEds=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "cssselect" ];

  meta = {
    description = "CSS Selectors for Python";
    homepage = "https://cssselect.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
})
