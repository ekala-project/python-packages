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
  version = "2.23.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-wS3OPxRATqNC15I2KSoV+8TO63hhckoJ3T/mDO9RPgs=";
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
