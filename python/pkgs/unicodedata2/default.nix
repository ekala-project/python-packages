{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "unicodedata2";
  version = "18.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-qVNikaUgTK9kI8p8VhMdRPKq/C+to1/zperIL3+MYqc=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "unicodedata2" ];

  meta = {
    description = "Backport and updates for the unicodedata module";
    homepage = "https://github.com/mikekap/unicodedata2";
    license = lib.licenses.asl20;
  };
})
