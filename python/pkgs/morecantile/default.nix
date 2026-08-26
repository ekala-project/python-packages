{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatchling,
  # dependencies
  attrs,
  click,
  pydantic,
  pyproj,
}:

buildPythonPackage rec {
  pname = "morecantile";
  version = "7.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "developmentseed";
    repo = "morecantile";
    tag = version;
    hash = "sha256-Hx4duNbTuRfOmNBLN9J6/6URe57aPc8+3SJA7rbW5zs=";
  };

  build-system = [ hatchling ];

  dependencies = [
    attrs
    click
    pydantic
    pyproj
  ];

  pythonImportsCheck = [ "morecantile" ];

  meta = {
    description = "Construct and use map tile grids in different projection";
    homepage = "https://developmentseed.org/morecantile";
    downloadPage = "https://github.com/developmentseed/morecantile";
    license = lib.licenses.mit;
    teams = [ ];
    mainProgram = "morecantile";
  };
}
