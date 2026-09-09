{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "types-six";
  version = "1.17.0.20260724";
  pyproject = true;

  src = fetchPypi {
    pname = "types_six";
    inherit version;
    hash = "sha256-16v6gtQOt9+7Y1bFsau03ch+CFRRWiE1Eua+mMXWvAI=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Typing stubs for six";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
}
