{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  pytest,
  # optional-dependencies
  psutil,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-run-parallel";
  version = "0.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Quansight-Labs";
    repo = "pytest-run-parallel";
    tag = "v${finalAttrs.version}";
    hash = "sha256-jUnMwKvHNM5/vwImkEa+Pbp/U3LcyYRYCabU4VbUOzU=";
  };

  build-system = [ setuptools ];

  dependencies = [ pytest ];

  optional-dependencies = {
    psutil = [
      psutil
    ];
  };

  pythonImportsCheck = [
    "pytest_run_parallel"
  ];

  meta = {
    description = "Simple pytest plugin to run tests concurrently";
    homepage = "https://github.com/Quansight-Labs/pytest-run-parallel";
    license = lib.licenses.mit;
  };
})
