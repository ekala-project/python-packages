{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
  urllib3,
}:

buildPythonPackage rec {
  pname = "id";
  version = "1.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-0HMtYk+0b9TnvE5RUvACFEUJU7nncsGCwcIpZN7xoGk=";
  };

  build-system = [ flit-core ];

  dependencies = [ urllib3 ];

  pythonImportsCheck = [ "id" ];

  meta = {
    description = "A tool for generating OIDC identities";
    homepage = "https://github.com/di/id";
    license = lib.licenses.asl20;
  };
}
