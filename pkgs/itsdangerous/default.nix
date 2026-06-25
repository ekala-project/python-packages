{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
}:

buildPythonPackage rec {
  pname = "itsdangerous";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4AUMC32h7qU/+vFJwM+7XG4uK2nEvvIsgfputz5fYXM=";
  };

  build-system = [ flit-core ];

  meta = {
    description = "Safely pass data to untrusted environments and back";
    homepage = "https://itsdangerous.palletsprojects.com";
    license = lib.licenses.bsd3;
  };
}
