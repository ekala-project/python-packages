{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "atpublic";
  version = "7.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Rm7xDQyLvRT9AqX71ai2r2qEY3PZEQbToHwW1y2Wtj4=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "public" ];

  meta = {
    description = "Python decorator and function which populates a module's __all__ and globals";
    homepage = "https://public.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
