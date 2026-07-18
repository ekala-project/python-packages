{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "netifaces-plus";
  version = "0.12.4";
  pyproject = true;

  src = fetchPypi {
    pname = "netifaces_plus";
    inherit version;
    hash = "sha256-75Y06DVytBZVo1Eu8+qpNsKpwrvvxmv+A9uJjhnXOJU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "netifaces" ];

  meta = {
    description = "Portable network interface information";
    homepage = "https://github.com/tsukumijima/netifaces-plus";
    license = lib.licenses.mit;
  };
}
