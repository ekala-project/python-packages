{
  lib,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  python-dateutil,
  requests,
  urllib3,
  requests-toolbelt,
  requests-unixsocket,
  setuptools,
  ws4py,
}:

buildPythonPackage rec {
  pname = "pylxd";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "canonical";
    repo = "pylxd";
    tag = version;
    hash = "sha256-s3BdHZFNkXRT1MoLQCQ4+XPPFanZNZVgOSmYhJkx7JE=";
  };

  pythonRelaxDeps = [ "urllib3" ];

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    python-dateutil
    requests
    requests-toolbelt
    requests-unixsocket
    urllib3
    ws4py
  ];

  pythonImportsCheck = [ "pylxd" ];

  meta = {
    description = "Library for interacting with the LXD REST API";
    homepage = "https://pylxd.readthedocs.io/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
