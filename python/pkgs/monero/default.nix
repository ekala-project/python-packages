{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pycryptodomex,
  pysocks,
  pynacl,
  requests,
  six,
  varint,
  pytestCheckHook,
  pytest-cov-stub,
  responses,
}:

buildPythonPackage rec {
  pname = "monero";
  version = "1.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "monero-ecosystem";
    repo = "monero-python";
    tag = "v${version}";
    hash = "sha256-WIF3pFBOLgozYTrQHLzIRgSlT3dTZTe+7sF/dVjVdTo=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "pynacl" ];
  pythonRemoveDeps = [ "ipaddress" ];

  pythonImportsCheck = [ "monero" ];

  dependencies = [
    pycryptodomex
    pynacl
    pysocks
    requests
    six
    varint
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-cov-stub
    responses
  ];

  meta = {
    description = "Comprehensive Python module for handling Monero";
    homepage = "https://github.com/monero-ecosystem/monero-python";
    license = lib.licenses.bsd3;
  };
}
