{ lib
, buildPythonPackage
, fetchFromGitHub
, psutil
, pytest
, requests
, setuptools-scm
, toml
, zc-lockfile
,
}:

buildPythonPackage rec {
  pname = "pytest-services";
  version = "2.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytest-dev";
    repo = "pytest-services";
    tag = "v${version}";
    hash = "sha256-kWgqb7+3/hZKUz7B3PnfxHZq6yU3JUeJ+mruqrMD/NE=";
  };

  build-system = [
    setuptools-scm
    toml
  ];

  buildInputs = [ pytest ];

  dependencies = [
    requests
    psutil
    zc-lockfile
  ];

  pythonImportsCheck = [ "pytest_services" ];

  meta = {
    description = "Services plugin for pytest testing framework";
    homepage = "https://github.com/pytest-dev/pytest-services";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
