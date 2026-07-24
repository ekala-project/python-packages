{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # propagates (optional, but unspecified)
  lz4,
  psutil,
}:

buildPythonPackage rec {
  pname = "joblib";
  version = "1.5.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hWGjJp5oARBoY/0NbYS7c3vp52MeM6rtP7nOWVNojaM=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    lz4
    psutil
  ];

  meta = {
    description = "Lightweight pipelining: using Python functions as pipeline jobs";
    homepage = "https://joblib.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}
