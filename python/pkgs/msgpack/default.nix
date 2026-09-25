{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cython,
}:

buildPythonPackage rec {
  pname = "msgpack";
  version = "1.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "msgpack";
    repo = "msgpack-python";
    tag = "v${version}";
    hash = "sha256-MMrgG3NudNVvt7xlsn4vUSIEVRGl/BGmXnpus3keGF8=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ cython ];
  pythonImportsCheck = [ "msgpack" ];
  preBuild = ''
    make cython
  '';

  meta = {
    description = "MessagePack serializer implementation";
    homepage = "https://github.com/msgpack/msgpack-python";
    license = lib.licenses.asl20;
  };
}
