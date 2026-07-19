{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage rec {
  pname = "multipart";
  version = "1.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IR18/Bp6Q+dcTSTuDo4PT2HVIvGiFXUwOuhTM96mh78=";
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
