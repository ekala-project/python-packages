{ lib
, buildPythonPackage
, fetchFromGitHub
, cython
, setuptools
, setuptools-scm
, deepdiff
, nibabel
, numpy
,
}:

buildPythonPackage rec {
  pname = "trx-python";
  version = "0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tee-ar-ex";
    repo = "trx-python";
    tag = version;
    hash = "sha256-gKPgP3GJ7QY0Piylk5L0HxnscRCREP1Hm5HZufL2h5g=";
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
  ];

  pythonImportsCheck = [ "trx" ];

  meta = {
    description = "Python implementation of the TRX file format";
    homepage = "https://github.com/tee-ar-ex/trx-python";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
