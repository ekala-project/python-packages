{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyro-api";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-obkA2VgKocL6s7Ejq3/zNBN0TafF9EC9Sq3E1A0U2SA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyroapi" ];

  meta = {
    description = "Generic API for dispatch to Pyro backends";
    homepage = "http://pyro.ai";
    license = lib.licenses.mit;
  };
}
