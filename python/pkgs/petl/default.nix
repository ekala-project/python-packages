{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "petl";
  version = "1.7.24";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "petl-developers";
    repo = "petl";
    tag = "v${version}";
    hash = "sha256-0YIaA/0VaQ1dgKC0NrLTkAsn8kkEHIJ4W9sdZHYQeMM=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];
  pythonImportsCheck = [
    "petl"
  ];

  meta = {
    homepage = "https://github.com/petl-developers/petl";
    description = "Python package for extracting, transforming and loading tables of data";
    license = lib.licenses.mit;
    mainProgram = "petl";
  };
}
