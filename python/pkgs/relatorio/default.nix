{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-tryton,
  genshi,
  lxml,
}:

buildPythonPackage (finalAttrs: {
  pname = "relatorio";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-GKDoxHIJo9a1ZcETZzD/FJIHwa51SPX5VDgslJgjf0I=";
  };

  build-system = [
    hatchling
    hatch-tryton
  ];

  dependencies = [
    genshi
    lxml
  ];

  pythonImportsCheck = [ "relatorio" ];

  meta = {
    description = "Templating library able to output odt and pdf files";
    homepage = "https://relatorio.tryton.org/";
    license = lib.licenses.gpl3Plus;
  };
})
