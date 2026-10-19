{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  zlib,
}:

buildPythonPackage (finalAttrs: {
  pname = "pybigwig";
  version = "0.3.25";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "deeptools";
    repo = "pyBigWig";
    tag = finalAttrs.version;
    hash = "sha256-Vq/QdJg2qObJ49lHZ4RjULfI0f7pScLRWGW8NBZoMAw=";
  };

  build-system = [ setuptools ];

  buildInputs = [ zlib ];

  pythonImportsCheck = [ "pyBigWig" ];

  meta = {
    description = "File access to bigBed files, and read and write access to bigWig files";
    homepage = "https://github.com/deeptools/pyBigWig";
    license = lib.licenses.mit;
  };
})
