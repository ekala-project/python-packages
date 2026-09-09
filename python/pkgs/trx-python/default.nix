{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cython,
  setuptools,
  setuptools-scm,
  deepdiff,
  nibabel,
  numpy,
  typer,
}:

buildPythonPackage rec {
  pname = "trx-python";
  version = "0.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tee-ar-ex";
    repo = "trx-python";
    tag = version;
    hash = "sha256-2rWFjnvOIMT++tk9Dcf3j/rsfGf+uQjueeR0pKMZqZM=";
  };

  build-system = [
    cython
    setuptools
    setuptools-scm
  ];

  dependencies = [
    deepdiff
    nibabel
    numpy
    typer
  ];

  pythonImportsCheck = [ "trx" ];

  meta = {
    description = "Python implementation of the TRX file format";
    homepage = "https://github.com/tee-ar-ex/trx-python";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
