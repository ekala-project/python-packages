{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "param";
  version = "2.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7HBmm9qaPBNJEJjn9bZA9gAitYsvW8eZcJnVTqI30d4=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  doCheck = false;

  pythonImportsCheck = [ "param" ];

  meta = {
    homepage = "https://param.holoviz.org/";
    description = "Declarative Python programming using Parameters";
    license = lib.licenses.bsd3;
  };
}
