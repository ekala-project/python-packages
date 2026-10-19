{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "progressbar";
  version = "2.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-XYHLUp2i4iO1OWKv1sjKDwXGZw5AMJpyGerMNq+bbGM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "progressbar" ];

  meta = {
    description = "Text progressbar library for python";
    homepage = "https://pypi.org/project/progressbar/";
    license = lib.licenses.lgpl3Plus;
  };
})
