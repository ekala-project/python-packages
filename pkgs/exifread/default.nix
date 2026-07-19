{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "exifread";
  version = "3.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-n5mPgNMGJ0HJdt/E/QM0JLxAkyk3mU5NIYHrcMS2rt0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "exifread" ];

  meta = {
    description = "Easy to use Python module to extract Exif metadata from tiff and jpeg files";
    homepage = "https://github.com/ianare/exif-py";
    license = lib.licenses.bsd0;
    mainProgram = "EXIF.py";
  };
}
