{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  pytest
, # optional-dependencies
  psutil
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-run-parallel";
  version = "0.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Quansight-Labs";
    repo = "pytest-run-parallel";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8ndm/CKtWieNF3mx7Ni7nPO4psam3TAM9NJzdiiSpPQ=";
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
    maintainers = [ ];
  };
})
