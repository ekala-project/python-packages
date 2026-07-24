{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  mock,
  six,
}:

buildPythonPackage rec {
  pname = "sure";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yPxvq8Dn9phO6ruUJUDkVkblvvC7mf5Z4C2mNOTUuco=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    mock
    six
  ];

  doCheck = false;

  pythonImportsCheck = [ "sure" ];

  meta = {
    homepage = "https://sure.readthedocs.io/";
    description = "Utility belt for automated testing";
    license = lib.licenses.gpl3Plus;
  };
}
