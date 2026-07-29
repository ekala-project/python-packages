{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  packaging,
  requests,
  urllib3,

  # optional-dependencies
  paramiko,
  websocket-client,
}:

buildPythonPackage rec {
  pname = "docker";
  version = "7.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "docker";
    repo = "docker-py";
    tag = version;
    hash = "sha256-4LmmWAmwoFroV4Ez0r1X72jCpBt69upQMrsA4eP5K6o=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    packaging
    requests
    urllib3
  ];

  optional-dependencies = {
    ssh = [ paramiko ];
    tls = [ ];
    websockets = [ websocket-client ];
  };

  pythonImportsCheck = [ "docker" ];

  meta = {
    description = "API client for docker written in Python";
    homepage = "https://github.com/docker/docker-py";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
