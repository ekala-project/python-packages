{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  portalocker,
}:

buildPythonPackage rec {
  pname = "concurrent_log_handler";
  version = "0.9.29";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vDenbT84TL9KmPaT69dwVD7cD0zVxqtrxw6eHX1YImU=";
  };

  build-system = [ hatchling ];

  dependencies = [ portalocker ];

  pythonImportsCheck = [ "concurrent_log_handler" ];

  meta = {
    description = "Python logging handler for safe concurrent log file writing";
    homepage = "https://github.com/Preston-Landers/concurrent-log-handler";
    license = lib.licenses.asl20;
  };
}
