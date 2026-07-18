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

buildPythonPackage rec {
  pname = "urlextract";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cFCOArqd83LiXPBkLbNnzs4nPocSzQzngXj8XdfqANs=";
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
}
