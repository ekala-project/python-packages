{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "shortuuid";
  version = "1.0.13";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-O7nPB/YGJgWEsd9GOZwLh92Edz57JZErfjkeMHl8XnI=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "shortuuid" ];

  meta = {
    description = "Library to generate concise, unambiguous and URL-safe UUIDs";
    mainProgram = "shortuuid";
    homepage = "https://github.com/stochastic-technologies/shortuuid/";
    license = lib.licenses.bsd3;
  };
}
