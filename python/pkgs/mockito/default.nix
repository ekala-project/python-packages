{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage rec {
  pname = "mockito";
  version = "1.5.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SYJuOQHcgm0CBOk7Ftzhxh3enTqU6tycIJqw4TAoM5M=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "mockito" ];

  meta = {
    description = "Spying framework";
    homepage = "https://github.com/kaste/mockito-python";
    license = lib.licenses.mit;
  };
}
