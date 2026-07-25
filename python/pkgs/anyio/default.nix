{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,

  # build-system
  setuptools-scm,

  # dependencies
  idna,
  typing-extensions,

  # optionals
  trio,
}:

buildPythonPackage rec {
  pname = "anyio";
  version = "4.14.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "agronholm";
    repo = "anyio";
    tag = version;
    hash = "sha256-MEU0c8/NI1vlyNtBsg/hGLv6DR619ZqoZzNY1eJLEWM=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    idna
  ]
  ++ lib.optionals (pythonOlder "3.13") [
    typing-extensions
  ];

  optional-dependencies = {
    trio = [ trio ];
  };
  disabledTestMarks = [
    "network"
  ];

  preCheck = lib.optionalString stdenv.hostPlatform.isDarwin ''
    # Work around "OSError: AF_UNIX path too long"
    export TMPDIR="/tmp"
  '';
  pythonImportsCheck = [ "anyio" ];
  meta = {
    description = "High level compatibility layer for multiple asynchronous event loop implementations on Python";
    homepage = "https://github.com/agronholm/anyio";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
