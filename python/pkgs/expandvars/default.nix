{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "expandvars";
  version = "1.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-bFgit7dWqZo1a5Fd0SZ/UquKTvqhNZY71/S9XTaPcdc=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "expandvars" ];

  meta = {
    description = "Expand system variables Unix style";
    homepage = "https://github.com/sayanarijit/expandvars";
    license = lib.licenses.mit;
  };
})
