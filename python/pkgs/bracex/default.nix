{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "bracex";
  version = "3.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-TjjjI5LkpHgP4V1kS/x8hRQFfPw4YeBgsRgUzoKcJeQ=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "bracex" ];

  meta = {
    homepage = "https://github.com/facelessuser/bracex";
    description = "Bash style brace expansion for Python";
    license = lib.licenses.mit;
  };
})
