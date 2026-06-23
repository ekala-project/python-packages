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
  ffmpeg-headless,
  freetype,
  qhull,

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

  # GTK3
  enableGtk3 ? false,
  cairo,
  gobject-introspection,
  gtk3,
  pycairo,
  pygobject3,

  # Tk
  enableTk ? (!stdenv.hostPlatform.isDarwin && !isPyPy),
  tkinter,

  # Qt
  enableQt ? false,
  pyqt5,

  # Webagg
  enableWebagg ? false,
  tornado,

  # nbagg
  enableNbagg ? false,
  ipykernel,

  # required for headless detection
  libx11,
  wayland,
}:

let
  interactive = enableTk || enableGtk3 || enableQt;
in

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
    ''
    + lib.optionalString (stdenv.hostPlatform.isLinux && interactive) ''
      # fix paths to libraries in dlopen calls (headless detection)
      substituteInPlace src/_c_internal_utils.cpp \
        --replace-fail libX11.so.6 ${libx11}/lib/libX11.so.6 \
        --replace-fail libwayland-client.so.0 ${wayland}/lib/libwayland-client.so.0
    '';

  nativeBuildInputs = [ pkg-config ] ++ lib.optionals enableGtk3 [ gobject-introspection ];

  buildInputs = [
    ffmpeg-headless
    freetype
    qhull
  ]
  ++ lib.optionals enableGtk3 [
    cairo
    gtk3
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
  ]
  ++ lib.optionals enableGtk3 [
    pycairo
    pygobject3
  ]
  ++ lib.optionals enableQt [ pyqt5 ]
  ++ lib.optionals enableWebagg [ tornado ]
  ++ lib.optionals enableNbagg [ ipykernel ]
  ++ lib.optionals enableTk [ tkinter ];

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
