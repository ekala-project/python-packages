{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "logutils";
  version = "0.3.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vAWKJdXCCUYfE04fA8q2N9ZqelzMEuWT21b7snmJmoI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "logutils" ];

  meta = {
    description = "Logging utilities";
    homepage = "https://bitbucket.org/vinay.sajip/logutils/";
    license = lib.licenses.bsd0;
  };
}
