{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  portalocker,
}:

buildPythonPackage (finalAttrs: {
  pname = "concurrent_log_handler";
  version = "0.9.31";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-L5c9V08IPlaS3+9HGTH0FtrydLvei0MO1dl5bFMrl80=";
  };

  build-system = [ hatchling ];

  dependencies = [ portalocker ];

  pythonImportsCheck = [ "concurrent_log_handler" ];

  meta = {
    description = "Python logging handler for safe concurrent log file writing";
    homepage = "https://github.com/Preston-Landers/concurrent-log-handler";
    license = lib.licenses.asl20;
  };
})
