{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  argparse-addons,
  humanfriendly,
  pyelftools,
}:

buildPythonPackage (finalAttrs: {
  pname = "bincopy";
  version = "20.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-6UpJi5pKvnZwPDdyqtRm8VY7T8mAnaeWXxG8dwlAk7k=";
  };

  build-system = [ setuptools ];

  dependencies = [
    argparse-addons
    humanfriendly
    pyelftools
  ];

  pythonImportsCheck = [ "bincopy" ];

  meta = {
    description = "Mangling of various binary file formats";
    homepage = "https://github.com/eerimoq/bincopy";
    license = lib.licenses.mit;
  };
})
