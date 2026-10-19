{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "ifaddr";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zAy/yqv3ZdRFlYJfuWqZuxLHlxa3O0QzDqOO4rDErtQ=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "ifaddr" ];

  meta = {
    homepage = "https://github.com/pydron/ifaddr";
    description = "Enumerates all IP addresses on all network adapters of the system";
    license = lib.licenses.mit;
  };
})
