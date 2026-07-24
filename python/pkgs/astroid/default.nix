{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "astroid";
  version = "4.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "astroid";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ADLAkPmLtiPx+7b9o0OLawupCtcAmT/jBdv7jqkWqBM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "astroid" ];

  meta = {
    description = "Abstract syntax tree for Python with inference support";
    homepage = "https://github.com/PyCQA/astroid";
    license = lib.licenses.lgpl21Plus;
  };
})
