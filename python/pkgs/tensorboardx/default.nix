{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  numpy,
  packaging,
  protobuf,
  setuptools,
  setuptools-scm,
  stdenv,
  tensorboard,
}:

buildPythonPackage rec {
  pname = "tensorboardx";
  version = "2.6.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lanpa";
    repo = "tensorboardX";
    tag = "v${version}";
    hash = "sha256-VTekZSfD2oZUQe7B2NwePlljGdrZNQMdjJ4K66hS4Ps=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  # required to make tests deterministic
  env.PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION = "python";

  dependencies = [
    packaging
    protobuf
    numpy
  ];

  pythonImportsCheck = [ "tensorboardX" ];
  meta = {
    description = "Library for writing tensorboard-compatible logs";
    homepage = "https://tensorboardx.readthedocs.io";
    downloadPage = "https://github.com/lanpa/tensorboardX";
    license = lib.licenses.mit;
    maintainers = [ ];
    platforms = lib.platforms.all;
  };
}
