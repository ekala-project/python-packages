{
  lib,
  buildPythonPackage,
  python,
  callPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
  configargparse,
  flask,
  flask-cors,
  flask-login,
  gevent,
  geventhttpclient,
  msgpack,
  locust-cloud,
  psutil,
  pyzmq,
  requests,
  tomli,
  werkzeug,
  pytest,
}:

buildPythonPackage rec {
  pname = "locust";
  version = "2.43.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "locustio";
    repo = "locust";
    tag = version;
    hash = "sha256-+0B4S524UjvaYl7VTZ1IY7UuBuDjUBqOvjHu0UVOi6A=";
  };

  postPatch = ''
    substituteInPlace locust/test/test_main.py \
      --replace-fail '"locust"' '"${placeholder "out"}/bin/locust"'

    substituteInPlace locust/test/test_log.py \
      --replace-fail '"locust"' '"${placeholder "out"}/bin/locust"'
  '';

  webui = callPackage ./webui.nix {
    inherit version;
    src = "${src}/locust/webui";
  };

  preBuild = ''
    mkdir -p $out/${python.sitePackages}/locust/webui/dist
    ln -sf ${webui}/dist/* $out/${python.sitePackages}/locust/webui/dist
  '';

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonRelaxDeps = [
    "flask-login"
    "flask-cors"
    "requests"
  ];

  dependencies = [
    configargparse
    flask
    flask-cors
    flask-login
    gevent
    geventhttpclient
    msgpack
    locust-cloud
    psutil
    pyzmq
    requests
    tomli
    werkzeug
    pytest
  ];

  pythonImportsCheck = [ "locust" ];

  doCheck = false;

  meta = {
    description = "Developer-friendly load testing framework";
    homepage = "https://docs.locust.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
