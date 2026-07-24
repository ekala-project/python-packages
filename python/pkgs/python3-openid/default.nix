{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  defusedxml,
}:

buildPythonPackage rec {
  pname = "python3-openid";
  version = "3.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-M/v2ko9AHgt5AVHtK1KQsCVF6HdfmCSFIFoGb4dKrq8=";
  };

  build-system = [ setuptools ];

  dependencies = [ defusedxml ];

  pythonImportsCheck = [ "openid" ];

  meta = {
    description = "OpenID support for modern servers and consumers";
    homepage = "https://github.com/necaris/python3-openid";
    license = lib.licenses.asl20;
  };
}
