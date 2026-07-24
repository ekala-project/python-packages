{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  certifi,
  durationpy,
  google-auth,
  python-dateutil,
  pyyaml,
  requests,
  requests-oauthlib,
  six,
  urllib3,
  websocket-client,
}:

buildPythonPackage rec {
  pname = "kubernetes";
  version = "36.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kubernetes-client";
    repo = "python";
    tag = "v${version}";
    hash = "sha256-e5fD5H33hkyVSbNTky2R4RbuIsR/MPNj2rYONKxyGOo=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    certifi
    durationpy
    google-auth
    python-dateutil
    pyyaml
    requests
    requests-oauthlib
    six
    urllib3
    websocket-client
  ];

  pythonImportsCheck = [ "kubernetes" ];

  meta = {
    description = "Kubernetes Python client";
    homepage = "https://github.com/kubernetes-client/python";
    license = lib.licenses.asl20;
  };
}
