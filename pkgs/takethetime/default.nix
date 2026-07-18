{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "takethetime";
  version = "0.3.1";
  pyproject = true;

  src = fetchPypi {
    pname = "TakeTheTime";
    inherit version;
    hash = "sha256-2+MEU6G1lqOPni4/qOGtxa8tv2RsoIN61cIFmhb+L/k=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "takethetime" ];

  meta = {
    description = "Simple time taking library using context managers";
    homepage = "https://github.com/ErikBjare/TakeTheTime";
    license = lib.licenses.mit;
  };
}
