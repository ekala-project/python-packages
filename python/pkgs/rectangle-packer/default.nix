{
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cython,
}:

buildPythonPackage (finalAttrs: {
  pname = "rectangle-packer";
  version = "2.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Penlect";
    repo = "rectangle-packer";
    tag = finalAttrs.version;
    hash = "sha256-fsBZzcDMXAk0GhsGd6KGPOHzbWj1jhTAVJSRNYN+RlU=";
  };

  build-system = [
    cython
    setuptools
  ];

  pythonImportsCheck = [ "rpack" ];

})
