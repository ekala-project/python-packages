{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "varint";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-puzAI3esXunWWmqK1Fyf8drIzO4ZQApZUPtR1ZQhTKU=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "varint" ];

  meta = {
    description = "Basic varint implementation in python";
    homepage = "https://github.com/fmoo/python-varint";
    license = lib.licenses.mit;
  };
}
