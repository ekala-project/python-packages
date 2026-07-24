{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch2,
  hatch-fancy-pypi-readme,
  hatch-vcs,
  hatchling,
  distro,
  packaging,
  setuptools,
  wheel,
  # Test Inputs
  cmake,
  cython,
  git,
  pytest-mock,
  requests,
  virtualenv,
}:

buildPythonPackage rec {
  pname = "scikit-build";
  version = "0.19.1";
  pyproject = true;

  src = fetchPypi {
    pname = "scikit_build";
    inherit version;
    hash = "sha256-uajQf8otXRDZMiC8V6aFFh1yrx/HYoXVXFZN2qhi5YQ=";
  };

  # This line in the filterwarnings section of the pytest configuration leads to this error:
  #  E   UserWarning: Distutils was imported before Setuptools, but importing Setuptools also replaces the `distutils` module in `sys.modules`. This may lead to undesirable behaviors or errors. To avoid these issues, avoid using distutils directly, ensure that setuptools is installed in the traditional way (e.g. not an editable install), and/or make sure that setuptools is always imported before distutils.
  postPatch = ''
    sed -i "/'error',/d" pyproject.toml
  '';

  build-system = [
    hatch-fancy-pypi-readme
    hatch-vcs
    hatchling
  ];

  dependencies = [
    distro
    packaging
    setuptools
    wheel
  ];
  dontUseCmakeConfigure = true;
  meta = {
    description = "Improved build system generator for CPython C/C++/Fortran/Cython extensions";
    homepage = "https://github.com/scikit-build/scikit-build";
    license = with lib.licenses; [
      mit
      bsd2
    ]; # BSD due to reuses of PyNE code
    maintainers = [ ];
  };
}
