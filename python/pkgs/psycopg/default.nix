{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,

  # build
  libpq,
  setuptools,

  # propagates
  typing-extensions,

  # psycopg-c
  cython,
}:

let
  pname = "psycopg";
  version = "3.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "psycopg";
    repo = "psycopg";
    tag = version;
    hash = "sha256-hHgswbqaoQRQrUxhNFG6tfmlap1mVUo/OkNsWF686U4=";
  };

  patches = [
    (replaceVars ./ctypes.patch {
      libpq = "${libpq}/lib/libpq${stdenv.hostPlatform.extensions.sharedLibrary}";
      libc = "${stdenv.cc.libc}/lib/libc.so.6";
    })
  ];

  baseMeta = {
    homepage = "https://github.com/psycopg/psycopg";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };

  psycopg-c = buildPythonPackage {
    pname = "${pname}-c";
    inherit version pyproject src;

    # apply patches to base repo
    inherit patches;

    # move into source root after patching
    postPatch = ''
      cd psycopg_c

      substituteInPlace pyproject.toml \
        --replace-fail "setuptools ==" "setuptools >="
    '';

    build-system = [
      cython
      setuptools
    ];

    buildInputs = [
      libpq
    ];

    meta = baseMeta // {
      description = "C optimisation distribution for Psycopg";
    };
  };

  psycopg-pool = buildPythonPackage {
    pname = "${pname}-pool";
    inherit version pyproject src;

    # apply patches to base repo
    inherit patches;

    # move into source root after patching
    postPatch = ''
      cd psycopg_pool
    '';

    build-system = [ setuptools ];

    dependencies = [ typing-extensions ];

    # the psycopg-pool version isn't updated in tandem with psycopg
    dontCheckPythonMetadata = true;

    meta = baseMeta // {
      description = "Connection Pool for Psycopg";
    };
  };
in

buildPythonPackage rec {
  inherit
    pname
    version
    pyproject
    src
    ;

  inherit patches;

  # only move to sourceRoot after patching, makes patching easier
  postPatch = ''
    cd psycopg
  '';

  build-system = [ setuptools ];

  propagatedBuildInputs = [
    psycopg-c
    typing-extensions
  ];

  pythonImportsCheck = [
    "psycopg"
    "psycopg_c"
    "psycopg_pool"
  ];

  optional-dependencies = {
    c = [ psycopg-c ];
    pool = [ psycopg-pool ];
  };

  passthru = {
    c = psycopg-c;
    pool = psycopg-pool;
  };

  meta = baseMeta // {
    description = "PostgreSQL database adapter for Python";
  };
}
