{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  pymeta3,
}:

buildPythonPackage (finalAttrs: {
  pname = "pybars3";
  version = "0.9.7";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ashH6QXlO5xbk2rxEskQR14nv3Z/efRSjBb5rx7A4lI=";
  };

  build-system = [ setuptools ];

  dependencies = [ pymeta3 ];

  pythonImportsCheck = [ "pybars" ];

  meta = {
    description = "Handlebars.js template support for Python 3 and 2";
    homepage = "https://github.com/wbond/pybars3";
    license = lib.licenses.lgpl3Only;
  };
})
