{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "types-decorator";
  version = "5.2.0.20260712";
  pyproject = true;

  src = fetchPypi {
    pname = "types_decorator";
    inherit version;
    hash = "sha256-KJDwX+PGVUa69QAP1fHu1NHJW65VFuI+FzW3taTdmMY=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Typing stubs for decorator";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
}
