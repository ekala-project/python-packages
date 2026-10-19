{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "mixins";
  version = "0.1.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-SmYYRzo6wClQBMc2oRgO0CQEHOxWe8GFL24TPa6A4NQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mixins" ];

  meta = {
    homepage = "https://github.com/nickderobertis/py-mixins";
    description = "Mixin classes which may be added to your own classes to add certain functionality to them";
    license = lib.licenses.mit;
  };
})
