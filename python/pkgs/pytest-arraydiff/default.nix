{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  numpy,
  pytest,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pytest-arraydiff";
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KTexRQ/JNWIPJHCdh9QMZ+BVoEPXuFQaJf36mU3aZ94=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  buildInputs = [ pytest ];

  dependencies = [ numpy ];

  # The tests requires astropy, which itself requires pytest-arraydiff

  pythonImportsCheck = [ "pytest_arraydiff" ];

  meta = {
    description = "Pytest plugin to help with comparing array output from tests";
    homepage = "https://github.com/astrofrog/pytest-arraydiff";
    license = lib.licenses.bsd3;
  };
}
