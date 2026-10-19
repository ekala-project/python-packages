{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "iniparse";
  version = "0.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ky5SOdUm56y1BAF7twe+ZwGaxCimkyNo5oUWkQk6qEI=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "iniparse" ];

  meta = {
    description = "Accessing and Modifying INI files";
    homepage = "https://github.com/candlepin/python-iniparse";
    license = lib.licenses.mit;
  };
})
