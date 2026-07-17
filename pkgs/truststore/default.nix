{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage rec {
  pname = "truststore";
  version = "0.10.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nZG9Q2RjrV5O5KunZmKN1s1wEM8+JGF1azMDcQ7rwwE=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "truststore" ];

  meta = {
    homepage = "https://github.com/sethmlarson/truststore";
    description = "Verify certificates using native system trust stores";
    license = lib.licenses.mit;
  };
}
