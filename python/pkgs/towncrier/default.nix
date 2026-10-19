{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  click,
  incremental,
  jinja2,
}:

buildPythonPackage (finalAttrs: {
  pname = "towncrier";
  version = "26.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-rOkDFjHHGMwHCRB7h1Xm4xNQ64rNyHevQ98xd63bmlU=";
  };

  build-system = [ hatchling ];

  dependencies = [
    click
    incremental
    jinja2
  ];

  pythonImportsCheck = [ "towncrier" ];

  meta = {
    description = "Utility to produce useful, summarised news files";
    homepage = "https://github.com/twisted/towncrier/";
    license = lib.licenses.mit;
  };
})
