{
  lib,
  buildPythonPackage,
  fetchPypi,
  keystoneauth1,
  oslo-config,
  oslo-serialization,
  pbr,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-keystoneclient";
  version = "6.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_keystoneclient";
    inherit version;
    hash = "sha256-1qw6Ca3yMZqqxXKOO/fL6vlSwpW9eDHx35pXOyX7z4I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    keystoneauth1
    oslo-config
    oslo-serialization
    pbr
  ];

  pythonImportsCheck = [ "keystoneclient" ];

  meta = {
    description = "Client Library for OpenStack Identity";
    homepage = "https://github.com/openstack/python-keystoneclient";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
