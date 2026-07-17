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
  version = "2.1.10";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FZABJrp9vh+DgZWDy+X/eaKUMiRgCHjYkwfkYzsy5Sg=";
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
