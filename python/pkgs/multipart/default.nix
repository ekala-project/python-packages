{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage rec {
  pname = "multipart";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1gdlZ7SJJwJx2ewQPUBHRdoVAa1bcOOn8fB/ViPYKFA=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "multipart" ];

  doCheck = false;

  meta = {
    description = "Parser for multipart/form-data";
    homepage = "https://github.com/defnull/multipart";
    license = lib.licenses.mit;
  };
}
