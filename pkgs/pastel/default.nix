{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "pastel";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5lgawE6XPKyFiCjGICweHoH+4dx952g/Ph/+C/2KVz0=";
  };

  build-system = [ poetry-core ];

  doCheck = false;

  pythonImportsCheck = [ "pastel" ];

  meta = {
    description = "Bring colors to your terminal";
    homepage = "https://github.com/sdispater/pastel";
    license = lib.licenses.mit;
  };
}
