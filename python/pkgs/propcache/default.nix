{
  lib,
  buildPythonPackage,
  cython,
  expandvars,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "propcache";
  version = "0.5.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "propcache";
    tag = "v${version}";
    hash = "sha256-vn6FSdWEMk6c8Cu1mHyhZyH8ZlFK0kgYK8T7GKLHHwc=";
  };

  postPatch = ''
    substituteInPlace packaging/pep517_backend/_backend.py \
      --replace "Cython ~=" "Cython >="
  '';

  build-system = [
    cython
    expandvars
    setuptools
  ];

  pythonImportsCheck = [ "propcache" ];

  meta = {
    description = "Fast property caching";
    homepage = "https://github.com/aio-libs/propcache";
    license = lib.licenses.asl20;
  };
}
