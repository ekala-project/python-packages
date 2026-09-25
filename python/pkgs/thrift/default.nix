{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "thrift";
  version = "0.24.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nvYBxJ6YhHX/DnQdjhtF/uwjtIUU5SQ0HvwnQZHxeJw=";
  };

  build-system = [ setuptools ];

  # Disable optimized byte-compilation which imports distutils (removed in Python 3.13)
  postPatch = ''
    substituteInPlace setup.cfg \
      --replace-fail "optimize = 1" "optimize = 0"
  '';

  dependencies = [
    setuptools
    six
  ];

  pythonImportsCheck = [ "thrift" ];

  meta = {
    description = "Python bindings for the Apache Thrift RPC system";
    homepage = "https://thrift.apache.org/";
    license = lib.licenses.asl20;
  };
}
