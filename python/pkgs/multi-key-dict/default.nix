{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "multi_key_dict";
  version = "2.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-3uvewXqjChxDLLP0N+gfhiHhwFQqDAYXp09x4jLpk54=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "multi_key_dict" ];

  meta = {
    homepage = "https://github.com/formiaczek/multi_key_dict";
    description = "Multi key dictionary implementation";
    license = lib.licenses.mit;
  };
})
