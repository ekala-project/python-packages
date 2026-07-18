{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "easydict";
  version = "1.13";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-sRNd7bxByAEOK8H3fsl0TH+qQrzhoch0FnkUSdbId4A=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "easydict" ];

  meta = {
    description = "Access dict values as attributes (works recursively)";
    homepage = "https://github.com/makinacorpus/easydict";
    license = lib.licenses.lgpl3;
  };
})
