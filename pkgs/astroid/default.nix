{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "astroid";
  version = "4.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "astroid";
    tag = "v${finalAttrs.version}";
    hash = "sha256-5p1xY6EWviSgmrLVOx3w7RcG/Vpx+sUtVndoxXrIFTQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "astroid" ];

  meta = {
    description = "Abstract syntax tree for Python with inference support";
    homepage = "https://github.com/PyCQA/astroid";
    license = lib.licenses.lgpl21Plus;
  };
})
