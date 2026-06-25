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
  version = "35.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kubernetes-client";
    repo = "python";
    tag = "v${version}";
    hash = "sha256-q52LqOz8aQkzWPwEy1c2jUQJ3hQ2sDVrYGkOgOc7Mm0=";
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
