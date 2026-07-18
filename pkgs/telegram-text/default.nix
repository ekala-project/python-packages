{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  poetry-core,
}:

buildPythonPackage rec {
  pname = "telegram_text";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7ilaNfLHckbdmoDF4ajezMWYlY3/NXQGl5AcYyxhIfo=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "telegram_text" ];

  meta = {
    description = "Python markup module for Telegram messenger";
    homepage = "https://telegram-text.alinsky.tech/";
    license = lib.licenses.mit;
  };
}
