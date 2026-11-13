{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "click-spinner";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "click_spinner";
    inherit (finalAttrs) version;
    hash = "sha256-ATcVUFlrwY8eFUa7KVZ0Xu04cjUjXmZLyW+MxnW31ug=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "click_spinner" ];

  meta = {
    description = "Add support for showing that command line app is active to Click";
    homepage = "https://github.com/click-contrib/click-spinner";
    license = lib.licenses.mit;
  };
})
