{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  boto3,
  requests,
  setuptools,
  python,
}:

buildPythonPackage rec {
  pname = "metaflow";
  version = "2.19.39";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Netflix";
    repo = "metaflow";
    tag = version;
    hash = "sha256-1YpOVPah0dYDeA3l0xCEF0lnx0IajobxRs3ReonOH2M=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    boto3
    requests
  ];

  checkPhase = ''
    runHook preCheck

    export HOME="$TMPDIR"
    export USER="metaflow-test-user"

    pushd test/core
    ${python.interpreter} run_tests.py --num-parallel $NIX_BUILD_CORES \
      --tests FlowOptionsTest,BasicLogTest
    popd

    runHook postCheck
  '';

  pythonImportsCheck = [ "metaflow" ];

  meta = {
    description = "Open Source AI/ML Platform";
    homepage = "https://metaflow.org/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
