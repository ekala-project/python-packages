{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "textparser";
  version = "0.26.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-hZglh2qcOPfDE+4c+ZGlnWtWIyqfZ75tzAp1jYRlT7o=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "textparser" ];

  meta = {
    description = "Text parser";
    homepage = "https://github.com/eerimoq/textparser";
    license = lib.licenses.mit;
  };
})
