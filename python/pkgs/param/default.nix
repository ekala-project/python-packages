{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "param";
  version = "2.5.0b4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zpmkutt6BLvgbsWRwQ4Pas3tAmFdu0DihJrYqImmMQw=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "param" ];

  meta = {
    homepage = "https://param.holoviz.org/";
    description = "Declarative Python programming using Parameters";
    license = lib.licenses.bsd3;
  };
})
