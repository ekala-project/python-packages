{
  buildPythonPackage,
  lib,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  numpy,
  scipy,
  attrs,
  pytest-xdist,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "iodata";
  version = "1.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "theochem";
    repo = "iodata";
    tag = "v${version}";
    hash = "sha256-ly5nEqgxCt5uU+UNQx/7zgrh+w1Plngarw29+Ns68ts=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    numpy
    scipy
    attrs
  ];

  pythonImportsCheck = [ "iodata" ];

  nativeCheckInputs = [
    pytest-xdist
    pytestCheckHook
  ];

  meta = {
    description = "Python library for reading, writing, and converting computational chemistry file formats and generating input files";
    mainProgram = "iodata-convert";
    homepage = "https://github.com/theochem/iodata";
    license = lib.licenses.lgpl3Only;
    maintainers = [ ];
  };
}
