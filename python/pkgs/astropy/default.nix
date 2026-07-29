{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  stdenv,
  cython,
  extension-helpers,
  setuptools,
  setuptools-scm,
  astropy-iers-data,
  numpy,
  packaging,
  pyerfa,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "astropy";
  version = "8.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "astropy";
    repo = "astropy";
    tag = "v${version}";
    hash = "sha256-pKptFnbhiE6DfsEZ557ugd6nrbWGg2FmEdhp78z+bUM=";
  };

  env = lib.optionalAttrs stdenv.cc.isClang {
    NIX_CFLAGS_COMPILE = "-Wno-error=unused-command-line-argument";
  };

  build-system = [
    cython
    extension-helpers
    setuptools
    setuptools-scm
  ];

  dependencies = [
    astropy-iers-data
    numpy
    packaging
    pyerfa
    pyyaml
  ];

  doCheck = false;

  pythonImportsCheck = [ "astropy" ];

  meta = {
    description = "Astronomy/Astrophysics library for Python";
    homepage = "https://www.astropy.org";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
