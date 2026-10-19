{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "tlv8";
  version = "0.10.0";
  pyproject = true;

  # pypi does not contain test files
  src = fetchFromGitHub {
    owner = "jlusiardi";
    repo = "tlv8_python";
    tag = "v${version}";
    sha256 = "sha256-G35xMFYasKD3LnGi9q8wBmmFvqgtg0HPdC+y82nxRWA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "tlv8" ];

  meta = {
    description = "Type-Length-Value8 (TLV8) for Python";
    homepage = "https://github.com/jlusiardi/tlv8_python";
    license = lib.licenses.asl20;
  };
}
