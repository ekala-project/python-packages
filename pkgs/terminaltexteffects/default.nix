{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage rec {
  pname = "terminaltexteffects";
  version = "0.14.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ITyJnOS492Q9LQVorxROEnThHkST259bBDh70XwhdxQ=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "terminaltexteffects" ];

  meta = {
    description = "Collection of visual effects that can be applied to terminal piped stdin text";
    homepage = "https://chrisbuilds.github.io/terminaltexteffects";
    mainProgram = "tte";
    license = lib.licenses.mit;
  };
}
