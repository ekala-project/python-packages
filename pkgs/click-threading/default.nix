{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  click,
}:

buildPythonPackage rec {
  pname = "click-threading";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rc/mI8AqWVwQfDFAcvZ6Inj+TrQLcsDRoskDzHivNDk=";
  };

  build-system = [ setuptools ];

  dependencies = [ click ];

  pythonImportsCheck = [ "click_threading" ];

  meta = {
    description = "Multithreaded Click apps made easy";
    homepage = "https://github.com/click-contrib/click-threading/";
    license = lib.licenses.mit;
  };
}
