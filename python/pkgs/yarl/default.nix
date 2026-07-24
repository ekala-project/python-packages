{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cython,
  expandvars,
  setuptools,
  idna,
  multidict,
  propcache,
}:

buildPythonPackage rec {
  pname = "yarl";
  version = "1.24.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "yarl";
    tag = "v${version}";
    hash = "sha256-2Uqn1TwfH375CBIveEpsco4dDNrhxHwX8wIP8dKhh/M=";
  };

  build-system = [
    cython
    expandvars
    setuptools
  ];

  dependencies = [
    idna
    multidict
    propcache
  ];

  pythonImportsCheck = [ "yarl" ];

  meta = {
    description = "Yet another URL library";
    homepage = "https://github.com/aio-libs/yarl";
    license = lib.licenses.asl20;
  };
}
