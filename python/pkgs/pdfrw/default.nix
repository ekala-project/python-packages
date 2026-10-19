{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pdfrw";
  version = "0.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-DcBJSg5lYbJoVCso7eIoA4fCcoEU8RfTu12OR4e5PvQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pdfrw" ];

  meta = {
    homepage = "https://github.com/pmaupin/pdfrw";
    description = "Pure Python library that reads and writes PDFs";
    license = lib.licenses.mit;
  };
})
