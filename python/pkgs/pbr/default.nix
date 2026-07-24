{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pbr";
  version = "7.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tGAE7DClMkZyaD7ISK7Z6PxQCw0mHUCjIpwtK7/O3Ck=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pbr" ];

  meta = {
    description = "Python Build Reasonableness";
    homepage = "https://github.com/openstack/pbr";
    license = lib.licenses.asl20;
  };
}
