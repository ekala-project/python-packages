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
  version = "1.23.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "yarl";
    tag = "v${version}";
    hash = "sha256-vjWV9fgBg7Mw54hsXWnO81CxJCe9WzB0okMEUz1KRAc=";
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
