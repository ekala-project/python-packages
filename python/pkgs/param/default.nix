{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "param";
  version = "2.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QMqUtyyXvxmYMlc44ALVic4xp8+0zFZUnwXapsz5gEM=";
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
