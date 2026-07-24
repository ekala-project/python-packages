{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-rerunfailures,
  pytest-xdist,
  setuptools,
  psutil,
  netcat,
  ps,
  python-daemon,
}:

buildPythonPackage rec {
  pname = "mirakuru";
  version = "3.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ClearcodeHQ";
    repo = "mirakuru";
    tag = "v${version}";
    hash = "sha256-3WyjvHxr+6kG+cLSCEZkHoA70mSoT66ubmp0W9g2yJM=";
  };

  postPatch = ''
    substituteInPlace tests/executors/test_output_executor_regression_issue_98.py \
      --replace-fail "timeout=15," "timeout=60,"
  '';

  build-system = [ setuptools ];

  dependencies = [ psutil ];
  # socket bind races, but requires xdist_group
  dontUsePytestXdist = true;

  pythonImportsCheck = [ "mirakuru" ];

  # Necessary for the tests to pass on Darwin with sandbox enabled.
  # Those are failing in the darwin sandbox with:
  # > ps: %mem: requires entitlement
  # > ps: vsz: requires entitlement
  # > ps: rss: requires entitlement
  # > ps: time: requires entitlement
  meta = {
    homepage = "https://github.com/dbfixtures/mirakuru";
    description = "Process orchestration tool designed for functional and integration tests";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };
}
