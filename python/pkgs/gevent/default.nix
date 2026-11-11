{
  stdenv,
  lib,
  fetchPypi,
  buildPythonPackage,
  isPyPy,
  python,
  libev,
  cffi,
  cython,
  greenlet,
  importlib-metadata,
  setuptools,
  zope-event,
  zope-interface,
  c-ares,
  libuv,
}:

buildPythonPackage (finalAttrs: {
  pname = "gevent";
  version = "26.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-TdRwPXFzekVsHJ31zUOoKTTlsQyHVJyqAklfSH0e8LE=";
  };

  build-system = [
    cython
    setuptools
  ]
  ++ lib.optionals (!isPyPy) [ cffi ];

  buildInputs = [
    libev
    libuv
    c-ares
  ];

  dependencies = [
    importlib-metadata
    zope-event
    zope-interface
  ]
  ++ lib.optionals (!isPyPy) [ greenlet ];

  env = {
    GEVENTSETUP_EMBED = "0";
  }
  // lib.optionalAttrs stdenv.cc.isGNU {
    NIX_CFLAGS_COMPILE = "-Wno-error=incompatible-pointer-types";
  };

  # Bunch of failures.

  pythonImportsCheck = [
    "gevent"
    "gevent.events"
  ];
})
