{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "hcloud";
  version = "2.22.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-S9vn+1ueS9PqsRjxJ4ueJNxioJJ5nfv22eXN9WjtfKQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    python-dateutil
  ];

  pythonImportsCheck = [ "hcloud" ];

  meta = {
    description = "Library for the Hetzner Cloud API";
    homepage = "https://github.com/hetznercloud/hcloud-python";
    license = lib.licenses.mit;
  };
}
