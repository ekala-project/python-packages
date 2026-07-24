{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  requests,
  urllib3,
}:

buildPythonPackage rec {
  pname = "requests-unixsocket";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    pname = "requests_unixsocket";
    inherit version;
    hash = "sha256-sllhWMNW7O5o0nukaaUiESMKxvsM3otmr7GfDtR6GZU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    requests
    urllib3
  ];

  doCheck = false;

  pythonImportsCheck = [ "requests_unixsocket" ];

  meta = {
    description = "Use requests to talk HTTP via a UNIX domain socket";
    homepage = "https://github.com/msabramo/requests-unixsocket";
    license = lib.licenses.asl20;
  };
}
