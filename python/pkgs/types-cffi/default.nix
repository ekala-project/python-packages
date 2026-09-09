{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  types-setuptools,
}:

buildPythonPackage rec {
  pname = "types-cffi";
  version = "2.1.0.20260827";
  pyproject = true;

  src = fetchPypi {
    pname = "types_cffi";
    inherit version;
    hash = "sha256-U9FgR3GtT/CaGpDW9pgKs2vrtsOUdtzFu/SJb6UQ1zY=";
  };

  build-system = [ setuptools ];

  dependencies = [ types-setuptools ];

  meta = {
    description = "Typing stubs for cffi";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
}
