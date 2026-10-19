{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "truststore";
  version = "0.10.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-nZG9Q2RjrV5O5KunZmKN1s1wEM8+JGF1azMDcQ7rwwE=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "truststore" ];

  meta = {
    homepage = "https://github.com/sethmlarson/truststore";
    description = "Verify certificates using native system trust stores";
    license = lib.licenses.mit;
  };
})
