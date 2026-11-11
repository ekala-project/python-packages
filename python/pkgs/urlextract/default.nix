{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  filelock,
  idna,
  platformdirs,
  uritools,
}:

buildPythonPackage (finalAttrs: {
  pname = "urlextract";
  version = "1.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VckUA+CfTh99NroO+4iIPkdu8UyNQjvdzgmDlckL4dg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    filelock
    idna
    platformdirs
    uritools
  ];

  pythonImportsCheck = [ "urlextract" ];

  meta = {
    description = "Collects and extracts URLs from given text";
    homepage = "https://github.com/lipoja/URLExtract";
    license = lib.licenses.mit;
  };
})
