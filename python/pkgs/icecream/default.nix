{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  asttokens,
  colorama,
  executing,
  pygments,
}:

buildPythonPackage (finalAttrs: {
  pname = "icecream";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-nX8kQYfwChP0rHfRdpkOGH6cJ51srE91SOM4KRrZc0M=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asttokens
    colorama
    executing
    pygments
  ];

  pythonImportsCheck = [ "icecream" ];

  meta = {
    description = "Little library for sweet and creamy print debugging";
    homepage = "https://github.com/gruns/icecream";
    license = lib.licenses.mit;
  };
})
