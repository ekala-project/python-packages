{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "unpaddedbase64";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cnPGDAid452Q9dbUp4g6eeMZ3J2bHIkkp/q5YXil8AU=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "unpaddedbase64" ];

  meta = {
    homepage = "https://github.com/matrix-org/python-unpaddedbase64";
    description = "Unpadded Base64";
    license = lib.licenses.asl20;
  };
}
