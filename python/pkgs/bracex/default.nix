{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "bracex";
  version = "3.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-0Yl2Fgs7oBpX1cU6XIw6olBu+p4KOmJGclH4K49WP94=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "bracex" ];

  meta = {
    homepage = "https://github.com/facelessuser/bracex";
    description = "Bash style brace expansion for Python";
    license = lib.licenses.mit;
  };
})
