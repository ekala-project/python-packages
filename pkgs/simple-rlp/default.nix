{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "simple-rlp";
  version = "0.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LfHSt2nwoBd9JiMauL4W5l41RrF7sKmkkO/TUXwIKHY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rlp" ];

  meta = {
    description = "Simple RLP (Recursive Length Prefix)";
    homepage = "https://github.com/SamuelHaidu/simple-rlp";
    license = lib.licenses.mit;
  };
}
