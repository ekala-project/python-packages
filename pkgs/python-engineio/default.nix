{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  simple-websocket,
}:

buildPythonPackage rec {
  pname = "python-engineio";
  version = "4.13.3";
  pyproject = true;

  src = fetchPypi {
    pname = "python_engineio";
    inherit version;
    hash = "sha256-Vyt3g+NB/tIe28fOopfM03ja15Jl/d6WqkZkQgp8Bsk=";
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
