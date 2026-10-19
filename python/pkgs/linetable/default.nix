{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "linetable";
  version = "0.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "amol-";
    repo = "linetable";
    tag = finalAttrs.version;
    hash = "sha256-nVZVxK6uB5TP0pReaEya3/lFXFkiqpnnaWqYzxzO6bM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "linetable" ];

  meta = {
    description = "Library to parse and generate co_linetable attributes in Python code objects";
    homepage = "https://github.com/amol-/linetable";
    license = lib.licenses.mit;
  };
})
