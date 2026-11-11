{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  idna,
}:

buildPythonPackage (finalAttrs: {
  pname = "url-normalize";
  version = "3.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "url_normalize";
    inherit (finalAttrs) version;
    hash = "sha256-E4kSgzwABex351bsIgWQ+Jcf8EYicoB5DOsA9audVrY=";
  };

  build-system = [ setuptools ];

  dependencies = [ idna ];

  # Upstream pins idna>=3.20, but only 3.19 is packaged here
  pythonRelaxDeps = [ "idna" ];

  pythonImportsCheck = [ "url_normalize" ];

  meta = {
    description = "URL normalization for Python";
    homepage = "https://github.com/niksite/url-normalize";
    license = lib.licenses.mit;
  };
})
