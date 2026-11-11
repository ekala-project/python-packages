{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  crc32c,
  future,
  pycryptodome,
  six,
}:

let
  version = "0.9.79";
in
buildPythonPackage {
  pname = "bce-python-sdk";
  inherit version;
  pyproject = true;

  src = fetchPypi {
    pname = "bce_python_sdk";
    inherit version;
    hash = "sha256-zXdHa0M0ftKNAhHVrVV+Uk4exki9CT1XxqbT3gdadQg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    crc32c
    future
    pycryptodome
    six
  ];

  pythonImportsCheck = [ "baidubce" ];

  meta = {
    description = "Baidu Cloud Engine SDK for python";
    homepage = "https://github.com/baidubce/bce-sdk-python";
    license = lib.licenses.asl20;
  };
}
