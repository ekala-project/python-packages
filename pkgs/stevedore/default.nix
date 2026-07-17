{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  pbr,
  setuptools,
}:

buildPythonPackage rec {
  pname = "stevedore";
  version = "5.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8i0VxurUDFu/qcpUqn57SgfVmzauA+0SztGlTPC1GUU=";
  };

  build-system = [
    pbr
    setuptools
  ];

  doCheck = false;

  pythonImportsCheck = [ "stevedore" ];

  meta = {
    description = "Manage dynamic plugins for Python applications";
    homepage = "https://github.com/openstack/stevedore";
    license = lib.licenses.asl20;
  };
}
