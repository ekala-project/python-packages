{
  lib,
  buildPythonPackage,
  configargparse,
  fetchFromGitHub,
  gevent,
  hatch-vcs,
  hatchling,
  platformdirs,
  python-engineio,
  python-socketio,
  requests,
  gevent-websocket,
  tomli,
  flask,
  requests-mock,
}:

buildPythonPackage rec {
  pname = "locust-cloud";
  version = "1.30.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "locustcloud";
    repo = "locust-cloud";
    tag = version;
    hash = "sha256-GJS0+CUYMz3G98I7Edj2qEsIFTp5wzsuSMmN7DlZPjA=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    configargparse
    gevent
    platformdirs
    python-engineio
    python-socketio
    requests
    tomli
  ];
  pythonImportsCheck = [ "locust_cloud" ];
  meta = {
    description = "Hosted version of Locust to run distributed load tests";
    homepage = "https://github.com/locustcloud/locust-cloud";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
