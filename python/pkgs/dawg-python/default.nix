{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "DAWG-Python";
  version = "0.7.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Sl4yhuYmHMoC8gXP1VFqerEBkPowxRwo00WAj1leNCE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dawg_python" ];

  meta = {
    description = "Pure Python reader for DAWGs created by dawgdic C++ library";
    homepage = "https://github.com/pytries/DAWG-Python";
    license = lib.licenses.mit;
  };
}
