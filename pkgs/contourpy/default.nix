{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python,

  # build
  meson,
  meson-python,
  ninja,
  nukeReferences,
  pybind11,
  pkg-config,

  # propagates
  numpy,

  # optionals
  bokeh,
  chromedriver,
  selenium,
}:

buildPythonPackage rec {
  pname = "contourpy";
  version = "1.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "contourpy";
    repo = "contourpy";
    tag = "v${version}";
    hash = "sha256-/tE+F1wH7YkqfgenXwtcfkjxUR5FwfgoS4NYC6n+/2M=";
  };

  # prevent unnecessary references to the build python when cross compiling
  postPatch = ''
    substituteInPlace lib/contourpy/util/_build_config.py.in \
      --replace-fail '@python_path@' "${python.interpreter}"
  '';

  nativeBuildInputs = [
    meson
    ninja
    nukeReferences
    pkg-config
  ];

  buildInputs = [
    pybind11
  ];

  build-system = [ meson-python ];

  dependencies = [ numpy ];

  passthru.optional-depdendencies = {
    bokeh = [
      bokeh
      chromedriver
      selenium
    ];
  };

  pythonImportsCheck = [ "contourpy" ];

  # remove references to buildPackages.python3, which is not allowed for cross builds.
  preFixup = ''
    nuke-refs $out/${python.sitePackages}/contourpy/util/{_build_config.py,__pycache__/_build_config.*}
  '';

  meta = {
    description = "Python library for calculating contours in 2D quadrilateral grids";
    homepage = "https://github.com/contourpy/contourpy";
    license = lib.licenses.bsd3;
  };
}
