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

buildPythonPackage rec {
  pname = "qbittorrent_api";
  version = "2026.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8uJb8HCWC5BgNZF6EHWQQrDCiKxq3xkbr09ISIkLghM=";
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
}
