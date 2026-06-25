{
  lib,
  buildPythonPackage,
  cython,
  expandvars,
  fetchFromGitHub,
  pep517,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "frozenlist";
  version = "1.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "frozenlist";
    tag = "v${version}";
    hash = "sha256-vkZ60qI0yQ82QSLQkBDzLnikTBQhUUuAzV+YsorrM2Q=";
  };

  nativeBuildInputs = [
    expandvars
    cython
    pep517
    setuptools
    wheel
  ];

  preBuild = ''
    cython frozenlist/_frozenlist.pyx
  '';

  pythonImportsCheck = [ "frozenlist" ];

  meta = {
    description = "Python module for list-like structure";
    homepage = "https://github.com/aio-libs/frozenlist";
    license = lib.licenses.asl20;
  };
}
