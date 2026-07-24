{
  lib,
  stdenv,
  fetchPypi,
  buildPythonPackage,
  isPyPy,

  # build-system
  certifi,
  pkg-config,
  pybind11,
  meson-python,
  setuptools-scm,

  # native libraries
  freetype,
  pkgs,

  # propagates
  contourpy,
  cycler,
  fonttools,
  kiwisolver,
  numpy,
  packaging,
  pillow,
  pyparsing,
  python-dateutil,

  # Webagg
  tornado,
}:

buildPythonPackage rec {
  version = "3.10.9";
  pname = "matplotlib";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/WZQjoxod9mOWGZUtgigRW241+ilRuseJgDv2VcwI1g=";
  };

  env.XDG_RUNTIME_DIR = "/tmp";

  postPatch =
    lib.optionalString isPyPy ''
      substituteInPlace tools/generate_matplotlibrc.py \
        --replace-fail "/usr/bin/env python3" "/usr/bin/env pypy3"
    ''
    + ''
      substituteInPlace pyproject.toml \
        --replace-fail "meson-python>=0.13.1,<0.17.0" meson-python

      patchShebangs tools
    '';

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    freetype
    pkgs.qhull
  ];

  hardeningDisable = lib.optionals stdenv.hostPlatform.isDarwin [ "strictoverflow" ];

  build-system = [
    certifi
    numpy
    pybind11
    meson-python
    setuptools-scm
  ];

  dependencies = [
    contourpy
    cycler
    fonttools
    kiwisolver
    numpy
    packaging
    pillow
    pyparsing
    python-dateutil
  ];

  optional-dependencies = {
    webagg = [ tornado ];
  };

  mesonFlags = lib.mapAttrsToList lib.mesonBool {
    system-freetype = true;
    system-qhull = true;
    b_lto = false;
  };

  doCheck = false;

  pythonImportsCheck = [ "matplotlib" ];

  meta = {
    description = "Python plotting library, making publication quality plots";
    homepage = "https://matplotlib.org/";
    license = with lib.licenses; [
      psfl
      bsd0
    ];
  };
}
