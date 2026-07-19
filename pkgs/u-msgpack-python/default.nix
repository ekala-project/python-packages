{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "u-msgpack-python";
  version = "2.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uAGoPW7XXm30HkRRi08qnCIdwtpLzVOA46D+2lILxho=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "umsgpack" ];

  meta = {
    description = "Portable, lightweight MessagePack serializer and deserializer written in pure Python";
    homepage = "https://github.com/vsergeev/u-msgpack-python";
    license = lib.licenses.mit;
  };
}
