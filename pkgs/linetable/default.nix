{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "linetable";
  version = "0.0.3";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "amol-";
    repo = "linetable";
    tag = version;
    hash = "sha256-nVZVxK6uB5TP0pReaEya3/lFXFkiqpnnaWqYzxzO6bM=";
  };

  pythonImportsCheck = [ "linetable" ];

  meta = {
    description = "Library to parse and generate co_linetable attributes in Python code objects";
    homepage = "https://github.com/amol-/linetable";
    license = lib.licenses.mit;
  };
}
