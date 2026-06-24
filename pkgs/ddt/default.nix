{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ddt";
  version = "1.7.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-0hXWsIOWMBPEoZseTc1qlugOQ6t3UZWXpqz88umj4Es=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "ddt" ];

  meta = {
    description = "Data-Driven/Decorated Tests, a library to multiply test cases";
    homepage = "https://github.com/txels/ddt";
    license = lib.licenses.mit;
  };
}
