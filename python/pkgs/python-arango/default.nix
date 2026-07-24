{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,

  # dependencies
  urllib3,
  requests,
  requests-toolbelt,
  pyjwt,
  importlib-metadata,
  packaging,

  # tests
  mock,
}:

let
  testDBOpts = {
    host = "127.0.0.1";
    port = "8529";
    password = "test";
    secret = "secret";
  };
in

buildPythonPackage rec {
  pname = "python-arango";
  version = "8.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arangodb";
    repo = "python-arango";
    tag = version;
    hash = "sha256-4nDMu0n6O0C9QMPDXCA2TkN56zqajn8qQqB6ma+JvAA=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [
    importlib-metadata
    requests
    requests-toolbelt
    packaging
    pyjwt
    setuptools
    urllib3
  ];
  # ArangoDB has been removed from Nixpkgs due to lack of maintenace,
  # so we cannot run the tests at present.
  #
  # Before that, the issue was:
  #
  # arangodb is compiled only for particular target architectures
  # (i.e. "haswell"). Thus, these tests may not pass reproducibly,
  # failing with: `166: Illegal instruction` if not run on arangodb's
  # specified architecture.
  #
  # nonetheless, the client library should remain in nixpkgs - since
  # the client library will talk to arangodb across the network and
  # architecture issues will be irrelevant.
  doCheck = false;

  #preCheck = lib.optionalString doCheck ''
  #  # Start test DB
  #  mkdir -p .nix-test/{data,work}
  #
  #  ICU_DATA=${arangodb}/share/arangodb3 \
  #  GLIBCXX_FORCE_NEW=1 \
  #  TZ=UTC \
  #  TZ_DATA=${arangodb}/share/arangodb3/tzdata \
  #  ARANGO_ROOT_PASSWORD=${testDBOpts.password} \
  #  ${arangodb}/bin/arangod \
  #    --server.uid=$(id -u) \
  #    --server.gid=$(id -g) \
  #    --server.authentication=true \
  #    --server.endpoint=http+tcp://${testDBOpts.host}:${testDBOpts.port} \
  #    --server.descriptors-minimum=4096 \
  #    --server.jwt-secret=${testDBOpts.secret} \
  #    --javascript.app-path=.nix-test/app \
  #    --log.file=.nix-test/log \
  #    --database.directory=.nix-test/data \
  #    --foxx.api=false &
  #'';
  pythonImportsCheck = [ "arango" ];

  meta = {
    description = "Python Driver for ArangoDB";
    homepage = "https://github.com/ArangoDB-Community/python-arango";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
