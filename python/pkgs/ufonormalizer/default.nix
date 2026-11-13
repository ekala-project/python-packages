{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "ufonormalizer";
  version = "0.6.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-wycQl6up0pBZS3XCtDLPaBCIt0/j6zNMpDGTJOK93U4=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  meta = {
    description = "Script to normalize the XML and other data inside of a UFO";
    mainProgram = "ufonormalizer";
    homepage = "https://github.com/unified-font-object/ufoNormalizer";
    license = lib.licenses.bsd3;
  };
})
