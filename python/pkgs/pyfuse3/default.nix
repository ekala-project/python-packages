{ lib
, buildPythonPackage
, fetchFromGitHub
, cython
, pkg-config
, setuptools
, setuptools-scm
, fuse3
, trio
,
}:

buildPythonPackage rec {
  pname = "pyfuse3";
  version = "3.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "libfuse";
    repo = "pyfuse3";
    tag = "v${version}";
    hash = "sha256-HhEtWYWdxJZOMS3dqB2VdQS7aSdpkRhq7EZCJ55n2OE=";
  };

  patches = [
    # Fix cross compilation by using PKG_CONFIG env variable instead
    # of hardcoded binary name
    # https://github.com/libfuse/pyfuse3/pull/148
    ./fix_cross_parse_pkg_config.patch
  ];

  build-system = [
    cython
    setuptools
    setuptools-scm
  ];

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ fuse3 ];

  dependencies = [ trio ];

  # Checks if a /usr/bin directory exists, can't work on NixOS
  pythonImportsCheck = [
    "pyfuse3"
  ];

  meta = {
    description = "Python 3 bindings for libfuse 3 with async I/O support";
    homepage = "https://github.com/libfuse/pyfuse3";
    license = lib.licenses.lgpl2Plus;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
