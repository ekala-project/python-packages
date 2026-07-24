{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "py-ubjson";
  version = "0.16.1";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "Iotic-Labs";
    repo = "py-ubjson";
    rev = "v${version}";
    sha256 = "1frn97xfa88zrfmpnvdk1pc03yihlchhph99bhjayvzlfcrhm5v3";
  };
  pythonImportsCheck = [ "ubjson" ];

  meta = {
    description = "Universal Binary JSON draft-12 serializer for Python";
    homepage = "https://github.com/Iotic-Labs/py-ubjson";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
