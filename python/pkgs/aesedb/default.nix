{
  lib,
  aiowinreg,
  buildPythonPackage,
  colorama,
  fetchFromGitHub,
  pycryptodomex,
  setuptools,
  tqdm,
  unicrypto,
}:

buildPythonPackage (finalAttrs: {
  pname = "aesedb";
  version = "0.1.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "skelsec";
    repo = "aesedb";
    tag = finalAttrs.version;
    hash = "sha256-YoeqxYkohAR6RaQYDXt7T00LCQDSb/o/ddxYRDGP/2s=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    aiowinreg
    colorama
    pycryptodomex
    tqdm
    unicrypto
  ];

  # Module has no tests

  pythonImportsCheck = [ "aesedb" ];

  meta = {
    description = "Parser for JET databases";
    mainProgram = "antdsparse";
    homepage = "https://github.com/skelsec/aesedb";
    license = lib.licenses.mit;
  };
})
