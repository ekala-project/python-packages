{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  blessed,
  prefixed,
}:

buildPythonPackage rec {
  pname = "enlighten";
  version = "1.14.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hcNUEqmk84hrMzfUH4E0Qfq5ow2fW18MAVvQeKRBFHM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    blessed
    prefixed
  ];

  pythonImportsCheck = [ "enlighten" ];

  meta = {
    description = "Enlighten Progress Bar for Python Console Apps";
    homepage = "https://github.com/Rockhopper-Technologies/enlighten";
    license = lib.licenses.mpl20;
  };
}
