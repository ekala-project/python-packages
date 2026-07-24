{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "xxhash";
  version = "3.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-sN5L86pmNjVS1SxqiQA8R5kR8SCYzUilPUSg96JffEY=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "xxhash" ];

  meta = {
    description = "Python Binding for xxHash";
    homepage = "https://github.com/ifduyue/python-xxhash";
    license = lib.licenses.bsd2;
  };
}
