{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,

  # build-system
  setuptools,

  # dependencies
  attrs,
  idna,
  outcome,
  sniffio,
  sortedcontainers,

  # tests
  pytest-trio,
}:

let
  # escape infinite recursion with pytest-trio
  pytest-trio' = (pytest-trio.override { trio = null; }).overrideAttrs {
    # `pythonRemoveDeps` is not working properly
    dontCheckRuntimeDeps = true;
    doCheck = false;
    pythonImportsCheck = [ ];
  };
in
buildPythonPackage rec {
  pname = "trio";
  version = "0.34.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-trio";
    repo = "trio";
    tag = "v${version}";
    hash = "sha256-5ooFU1TP9CU0+dpIWs8cw+gHvBzntCnxejpBQn/QffE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    attrs
    idna
    outcome
    sniffio
    sortedcontainers
  ];
  # It appears that the build sandbox doesn't include /etc/services, and these tests try to use it.
  meta = {
    description = "Async/await-native I/O library for humans and snake people";
    homepage = "https://github.com/python-trio/trio";
    license = with lib.licenses; [
      mit
      asl20
    ];
  };
}
