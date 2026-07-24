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
  version = "2026.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nwpuM+5NuikNFV3jrVnBkd4C5NljnUJL8C7EoA7PMgU=";
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
