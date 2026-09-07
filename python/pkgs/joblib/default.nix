{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # propagates (optional, but unspecified)
  cloudpickle,
  lz4,
  psutil,
}:

buildPythonPackage rec {
  pname = "joblib";
  version = "1.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LMyWeFsSBGwI/W1Vg5wShXgxtUo8FnP/rdLwS/xO2gM=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    cloudpickle
    lz4
    psutil
  ];

  meta = {
    description = "Lightweight pipelining: using Python functions as pipeline jobs";
    homepage = "https://joblib.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}
