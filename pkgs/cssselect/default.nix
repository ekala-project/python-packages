{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cssselect";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-V/iplCTPqyiaG2qBakMHWksAlIyGtNzz707n4V96sMc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "cssselect" ];

  meta = {
    description = "CSS Selectors for Python";
    homepage = "https://cssselect.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}
