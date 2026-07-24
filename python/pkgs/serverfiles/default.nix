{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "serverfiles";
  version = "0.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XhD8MudYeR43NbwIvOLtRwKoOx5Fq5bF1ZzIruz76+E=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "serverfiles" ];

  meta = {
    description = "Utility that accesses files on a HTTP server and stores them locally for reuse";
    homepage = "https://github.com/biolab/serverfiles";
    license = lib.licenses.gpl3Plus;
  };
}
