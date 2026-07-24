{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  click,
}:

buildPythonPackage rec {
  pname = "userpath";
  version = "1.9.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-bFIojasGklfMgxhG0V1IEzUiRV1Gd+5pqXgfEdvv2BU=";
  };

  build-system = [ hatchling ];

  dependencies = [ click ];

  doCheck = false;

  pythonImportsCheck = [ "userpath" ];

  meta = {
    homepage = "https://github.com/ofek/userpath";
    description = "Cross-platform tool for adding locations to the user PATH";
    license = with lib.licenses; [
      asl20
      mit
    ];
  };
}
