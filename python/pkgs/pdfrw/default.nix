{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pdfrw";
  version = "0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DcBJSg5lYbJoVCso7eIoA4fCcoEU8RfTu12OR4e5PvQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pdfrw" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/pmaupin/pdfrw";
    description = "Pure Python library that reads and writes PDFs";
    license = lib.licenses.mit;
  };
}
