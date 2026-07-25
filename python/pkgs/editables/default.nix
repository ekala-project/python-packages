{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
}:

buildPythonPackage rec {
  pname = "editables";
  version = "0.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-EWODSQI4HEYTeHlRxZFIAP3xVa4IhIo3O46lAGeAl3w=";
  };

  build-system = [ flit-core ];
  # Tests not included in archive.
  doCheck = false;

  pythonImportsCheck = [ "editables" ];

  meta = {
    description = "Editable installations";
    homepage = "https://github.com/pfmoore/editables";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
