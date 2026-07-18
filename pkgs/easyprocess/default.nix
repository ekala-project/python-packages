{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "EasyProcess";
  version = "1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iFiYMCpXqrlIlz6LXTKkIpOSufstmGqx1P/VkOW6kOw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "easyprocess" ];

  meta = {
    description = "Easy to use python subprocess interface";
    homepage = "https://github.com/ponty/EasyProcess";
    license = lib.licenses.bsdOriginal;
  };
}
