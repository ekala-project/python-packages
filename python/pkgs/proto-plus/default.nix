{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  protobuf,
}:

buildPythonPackage rec {
  pname = "proto-plus";
  version = "1.27.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "proto-plus-python";
    tag = "v${version}";
    hash = "sha256-B+CkOLzbpu3XXnH7MND5GCljG/bUyPPU57zXIIXoRiU=";
  };

  build-system = [ setuptools ];

  dependencies = [ protobuf ];

  pythonRelaxDeps = [ "protobuf" ];

  pythonImportsCheck = [ "proto" ];

  meta = {
    description = "Beautiful, idiomatic protocol buffers in Python";
    homepage = "https://github.com/googleapis/proto-plus-python";
    license = lib.licenses.asl20;
  };
}
