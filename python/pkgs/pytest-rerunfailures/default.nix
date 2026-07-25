{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  packaging,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-rerunfailures";
  version = "16.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytest-dev";
    repo = "pytest-rerunfailures";
    tag = version;
    hash = "sha256-wdUNGc50Yqrctc8OXBmgRwmHVjSeOq+ADRYcLtKSraM=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ packaging ];
  meta = {
    description = "Pytest plugin to re-run tests to eliminate flaky failures";
    homepage = "https://github.com/pytest-dev/pytest-rerunfailures";
    license = lib.licenses.mpl20;
    maintainers = [ ];
  };
}
