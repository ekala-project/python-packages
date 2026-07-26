{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pymupdf,
  tabulate,
}:

buildPythonPackage (finalAttrs: {
  pname = "pymupdf4llm";
  version = "0.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pymupdf";
    repo = "RAG";
    tag = "v${finalAttrs.version}";
    hash = "sha256-SgJ47jkE6GcSXVsOMOx8Hm+Ce6pCAjLEhdxGeJEu6DQ=";
  };

  sourceRoot = "${finalAttrs.src.name}/pymupdf4llm";

  build-system = [ setuptools ];

  dependencies = [
    pymupdf
    tabulate
  ];
  pythonImportsCheck = [ "pymupdf4llm" ];

  meta = {
    description = "PyMuPDF Utilities for LLM/RAG - converts PDF pages to Markdown format for Retrieval-Augmented Generation";
    homepage = "https://github.com/pymupdf/RAG";
    license = lib.licenses.agpl3Only;
    maintainers = [ ];
  };
})
