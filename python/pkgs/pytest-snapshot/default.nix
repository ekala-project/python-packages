{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools-scm,
  packaging,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-snapshot";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "joseph-roitman";
    repo = "pytest-snapshot";
    tag = "v${version}";
    hash = "sha256-0PZu9wL29iEppLxxbl4D0E4WfOHe61KUUld003cRBRU=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    packaging
    pytest
  ];

  pythonImportsCheck = [ "pytest_snapshot" ];

  meta = {
    description = "Plugin to enable snapshot testing with pytest";
    homepage = "https://github.com/joseph-roitman/pytest-snapshot/";
    license = lib.licenses.mit;
  };
}
