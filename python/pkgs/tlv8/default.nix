{ lib
, buildPythonPackage
, fetchFromGitHub
,
}:

buildPythonPackage rec {
  pname = "tlv8";
  version = "0.10.0";
  format = "setuptools";

  # pypi does not contain test files
  src = fetchFromGitHub {
    owner = "jlusiardi";
    repo = "tlv8_python";
    rev = "v${version}";
    sha256 = "sha256-G35xMFYasKD3LnGi9q8wBmmFvqgtg0HPdC+y82nxRWA=";
  };

  pythonImportsCheck = [ "tlv8" ];

  meta = {
    description = "Type-Length-Value8 (TLV8) for Python";
    homepage = "https://github.com/jlusiardi/tlv8_python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
