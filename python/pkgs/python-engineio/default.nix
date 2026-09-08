{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  simple-websocket,
}:

buildPythonPackage rec {
  pname = "python-engineio";
  version = "4.14.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_engineio";
    inherit version;
    hash = "sha256-6qHjhrr5wseVnu9/nZFlxeqRDFs5L1MW540p7Qc8tD0=";
  };

  build-system = [ setuptools ];

  dependencies = [ simple-websocket ];

  doCheck = false;

  pythonImportsCheck = [ "engineio" ];

  meta = {
    description = "Python based Engine.IO client and server";
    homepage = "https://github.com/miguelgrinberg/python-engineio/";
    license = lib.licenses.mit;
  };
}
