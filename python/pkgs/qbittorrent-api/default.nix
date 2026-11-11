{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  packaging,
  requests,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "qbittorrent_api";
  version = "2026.10.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-cKZqvzgRcCViQOGIyCVjSEn9AusuxAv24Vei349dSEs=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    packaging
    requests
    urllib3
  ];

  pythonImportsCheck = [ "qbittorrentapi" ];

  meta = {
    description = "Python client implementation for qBittorrent's Web API";
    homepage = "https://github.com/rmartin16/qbittorrent-api";
    license = lib.licenses.mit;
  };
})
