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

  # Thrift's bdist_wheel step spawns a subprocess for byte-compilation that
  # does "from distutils.util import byte_compile". On Python 3.13+, distutils
  # was removed from stdlib. Create a setup.cfg that disables byte-compilation.
  postPatch = ''
    cat >> setup.cfg <<CFG
    [install]
    compile = 0
    optimize = 0
    CFG
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
    maintainers = [ ];
  };
}
