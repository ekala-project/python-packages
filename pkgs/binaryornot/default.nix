{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  chardet,
}:

buildPythonPackage rec {
  pname = "binaryornot";
  version = "0.4.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NZUB38nUBjLtyfrIkOGVQtsaKHu8+lgXW2Zlg5IBgGE=";
  };

  build-system = [ setuptools ];

  dependencies = [ chardet ];

  pythonImportsCheck = [ "binaryornot" ];

  meta = {
    description = "Ultra-lightweight pure Python package to check if a file is binary or text";
    homepage = "https://github.com/audreyr/binaryornot";
    license = lib.licenses.bsd3;
  };
}
