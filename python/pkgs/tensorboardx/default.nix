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
  version = "2.6.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lanpa";
    repo = "tensorboardX";
    tag = "v${version}";
    hash = "sha256-GZQUJCiCKVthO95jHMIzNFcBM3R85BkyxO74CKCzizc=";
  };

  postPatch = ''
    # https://github.com/lanpa/tensorboardX/pull/761
    substituteInPlace tensorboardX/utils.py tests/test_utils.py \
      --replace-fail "newshape=" "shape="
  '';

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
