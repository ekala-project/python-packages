{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pylatexenc,
  pyparsing,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "bibtexparser";
  version = "2.0.0b9";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "sciunto-org";
    repo = "python-${finalAttrs.pname}";
    tag = "v${finalAttrs.version}";
    hash = "sha256-viBY2hZXsXsfjpi7zMFh3CwQFOKL41F3x0IKULelo/o=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pylatexenc
    pyparsing
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "bibtexparser" ];

  meta = {
    description = "Bibtex parser for Python";
    homepage = "https://github.com/sciunto-org/python-bibtexparser";
    license = with lib.licenses; [
      lgpl3Only # or
      bsd3
    ];
  };
})
