{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  latexcodec,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "pybtex";
  version = "0.26.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-LlVDvqQk5g6eQu73C/9Ze+SGSdj2i6Bhp6CSskd9VGQ=";
  };

  build-system = [ hatchling ];

  dependencies = [
    latexcodec
    pyyaml
  ];

  pythonImportsCheck = [ "pybtex" ];

  meta = {
    description = "BibTeX-compatible bibliography processor written in Python";
    homepage = "https://pybtex.org/";
    license = lib.licenses.mit;
  };
})
