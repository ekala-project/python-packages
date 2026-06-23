{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyasn1";
  version = "0.6.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyasn1";
    repo = "pyasn1";
    tag = "v${finalAttrs.version}";
    hash = "sha256-fHpAJ1WSoLwaWuSMcfHjZmnl8oNhADrdjHaYIEmqQiw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyasn1" ];

  meta = {
    description = "Generic ASN.1 library for Python";
    homepage = "https://pyasn1.readthedocs.io";
    license = lib.licenses.bsd2;
  };
})
