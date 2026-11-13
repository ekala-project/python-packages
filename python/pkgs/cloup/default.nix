{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  hatchling,
  hatch-vcs,
  click,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "cloup";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-g7CHDuhjvMhRKeQOGyCLz96+TNIULpzh0Nr30nbKsDg=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    click
  ]
  ++ lib.optionals (pythonOlder "3.12") [ typing-extensions ];

  pythonImportsCheck = [ "cloup" ];

  meta = {
    description = "Click extended with option groups, constraints, aliases, help themes";
    homepage = "https://github.com/janLuke/cloup";
    license = lib.licenses.bsd3;
  };
})
