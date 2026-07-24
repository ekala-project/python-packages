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

buildPythonPackage rec {
  pname = "icecream";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nX8kQYfwChP0rHfRdpkOGH6cJ51srE91SOM4KRrZc0M=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asttokens
    colorama
    executing
    pygments
  ];

  doCheck = false;

  pythonImportsCheck = [ "icecream" ];

  meta = {
    description = "Little library for sweet and creamy print debugging";
    homepage = "https://github.com/gruns/icecream";
    license = lib.licenses.mit;
  };
}
