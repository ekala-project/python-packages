{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
  python-dateutil,
}:

buildPythonPackage (finalAttrs: {
  pname = "hcloud";
  version = "2.27.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-djbRJDHu0V3lH/rDe8PucNNqfhuStnHOOEvhCKcPZp8=";
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
})
