{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "terminaltexteffects";
  version = "0.15.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-9LMchr+pQ9W/Oyxey/rqDeZe1KlRAoxA+OTLVO/QZDk=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "terminaltexteffects" ];

  meta = {
    description = "Collection of visual effects that can be applied to terminal piped stdin text";
    homepage = "https://chrisbuilds.github.io/terminaltexteffects";
    mainProgram = "tte";
    license = lib.licenses.mit;
  };
})
