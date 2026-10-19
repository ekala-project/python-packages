{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "py-ubjson";
  version = "0.16.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Iotic-Labs";
    repo = "py-ubjson";
    tag = "v${version}";
    sha256 = "1frn97xfa88zrfmpnvdk1pc03yihlchhph99bhjayvzlfcrhm5v3";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "ubjson" ];

  meta = {
    description = "Universal Binary JSON draft-12 serializer for Python";
    homepage = "https://github.com/Iotic-Labs/py-ubjson";
    license = lib.licenses.asl20;
  };
}
