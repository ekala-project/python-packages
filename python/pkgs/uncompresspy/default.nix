{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "uncompresspy";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-556tZurtjUI2TYB8C6PzqK7w4Ah6m+rxpg8jqAimwUc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "uncompresspy" ];

  meta = {
    description = "Pure Python package for uncompressing LZW files (.Z)";
    homepage = "https://github.com/kYwzor/uncompresspy";
    license = lib.licenses.bsd3;
  };
}
