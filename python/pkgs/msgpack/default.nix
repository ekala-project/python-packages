{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cython,
}:

buildPythonPackage rec {
  pname = "msgpack";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "msgpack";
    repo = "msgpack-python";
    tag = "v${version}";
    hash = "sha256-L8nU+n0M3NJvQzjRlWESXvzP6CxR5CTSu7UkeGfHHUs=";
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
    maintainers = [ ];
  };
}
