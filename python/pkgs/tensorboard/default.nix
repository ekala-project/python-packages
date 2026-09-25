{
  lib,
  fetchPypi,
  buildPythonPackage,

  # dependencies
  absl-py,
  grpcio,
  markdown,
  numpy,
  packaging,
  pillow,
  protobuf,
  setuptools,
  tensorboard-data-server,
  werkzeug,
  standard-imghdr,
}:

buildPythonPackage rec {
  pname = "tensorboard";
  version = "2.21.0";
  format = "wheel";

  # tensorflow/tensorboard is built from a downloaded wheel, because
  # https://github.com/tensorflow/tensorboard/issues/719 blocks buildBazelPackage.
  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    dist = "py3";
    python = "py3";
    hash = "sha256-cnkxbctr1bw5HWI96oQVMSmc3hiHMQ6BM7w0qZbTIlU=";
  };

  pythonRelaxDeps = [
    "google-auth-oauthlib"
    "protobuf"
  ];

  dependencies = [
    absl-py
    grpcio
    markdown
    numpy
    packaging
    pillow
    protobuf
    setuptools
    tensorboard-data-server
    werkzeug

    # Requires 'imghdr' which has been removed from python in 3.13
    # ModuleNotFoundError: No module named 'imghdr'
    # https://github.com/tensorflow/tensorboard/issues/6964
    standard-imghdr
  ];

  pythonImportsCheck = [
    "tensorboard"
    "tensorboard.backend"
    "tensorboard.compat"
    "tensorboard.data"
    "tensorboard.plugins"
    "tensorboard.summary"
    "tensorboard.util"
  ];
  meta = {
    description = "TensorFlow's Visualization Toolkit";
    homepage = "https://www.tensorflow.org/";
    license = lib.licenses.asl20;
    mainProgram = "tensorboard";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
