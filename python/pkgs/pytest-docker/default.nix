{
  lib,
  attrs,
  buildPythonPackage,
  fetchFromGitHub,
  pytest,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pytest-docker";
  version = "3.2.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "avast";
    repo = "pytest-docker";
    tag = "v${version}";
    hash = "sha256-AkVLfCt2aQZrvSfa/5oXr95XUIR5mRqcMRz67kmuKKw=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ attrs ];

  pythonImportsCheck = [ "pytest_docker" ];

  meta = {
    description = "Docker-based integration tests";
    homepage = "https://github.com/avast/pytest-docker";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
