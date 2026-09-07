{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  chardet,
}:

buildPythonPackage rec {
  pname = "binaryornot";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zI1Xz6cddP+MKKdyZzTVOoUdAvrZ46VYH7gH+Yn3AvA=";
  };

  build-system = [ hatchling ];

  dependencies = [ chardet ];

  pythonImportsCheck = [ "binaryornot" ];

  meta = {
    description = "Ultra-lightweight pure Python package to check if a file is binary or text";
    homepage = "https://github.com/audreyr/binaryornot";
    license = lib.licenses.bsd3;
  };
}
