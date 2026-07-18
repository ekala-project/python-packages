{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  chardet,
}:

buildPythonPackage rec {
  pname = "encutils";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-OOylrxjOur2L5DwX8UydP7uoPMX3rI46schuJMSyuRo=";
  };

  build-system = [ flit-core ];

  dependencies = [ chardet ];

  pythonImportsCheck = [ "encutils" ];

  meta = {
    description = "Collection of helper functions to detect encodings of text files";
    homepage = "https://github.com/coherent-oss/encutils";
    license = lib.licenses.lgpl3Plus;
  };
}
