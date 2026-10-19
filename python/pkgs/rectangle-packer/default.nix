{
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cython,
}:

buildPythonPackage (finalAttrs: {
  pname = "rectangle-packer";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Penlect";
    repo = "rectangle-packer";
    tag = finalAttrs.version;
    hash = "sha256-rdryJvY1kSRVIlC8LOr+//0fQLWEIExRQxuI3W53n18=";
  };

  build-system = [
    cython
    setuptools
  ];

  pythonImportsCheck = [ "rpack" ];

})
