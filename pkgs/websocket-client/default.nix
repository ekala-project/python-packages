{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "websocket-client";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    pname = "websocket_client";
    inherit version;
    hash = "sha256-noE2JLbrYZmZqX3HlYRpIXwxdjErOhakvRvH4IpG7Jg=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    optional = [
      # python-socks is not available at the moment
      # wsaccel is not available at the moment
    ];
  };

  pythonImportsCheck = [ "websocket" ];

  meta = {
    description = "Websocket client for Python";
    homepage = "https://github.com/websocket-client/websocket-client";
    license = lib.licenses.lgpl21Plus;
    mainProgram = "wsdump";
  };
}
