{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-timeout";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytest-dev";
    repo = "pytest-timeout";
    tag = version;
    hash = "sha256-NGTy3Hua6yEMWXQDJQO2Z5DD3clXTZXEH6DNQBMSGtQ=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];
  pythonImportsCheck = [ "pytest_timeout" ];

  meta = {
    description = "Pytest plugin to abort hanging tests";
    homepage = "https://github.com/pytest-dev/pytest-timeout/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
