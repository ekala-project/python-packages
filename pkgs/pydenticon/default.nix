{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pillow,
  mock,
}:

buildPythonPackage rec {
  pname = "pydenticon";
  version = "0.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LvNjzdb08Bk85iJXSGAn42iEVw9hQLveUd5y3zIbd/E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pillow
    mock
  ];

  pythonImportsCheck = [ "pydenticon" ];

  meta = {
    description = "Library for generating identicons";
    homepage = "https://github.com/azaghal/pydenticon";
    license = lib.licenses.bsd0;
  };
}
