{ lib
, buildPythonPackage
, fetchPypi
, keystoneauth1
, oslo-config
, oslo-serialization
, pbr
, setuptools
,
}:

buildPythonPackage rec {
  pname = "python-keystoneclient";
  version = "5.8.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_keystoneclient";
    inherit version;
    hash = "sha256-PKh8Z8QEKYzoYjELVp9UWlis91zVaFCUyC81Mgs6NV0=";
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
