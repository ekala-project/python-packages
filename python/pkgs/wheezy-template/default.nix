{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "wheezy.template";
  version = "3.2.5";
  pyproject = true;

  src = fetchPypi {
    pname = "wheezy_template";
    inherit (finalAttrs) version;
    hash = "sha256-x8C/ha8PcMou9LbqmnTvNy9zOSqhe+oNiF3LpzVtCGc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "wheezy.template" ];

  meta = {
    homepage = "https://wheezytemplate.readthedocs.io/en/latest/";
    description = "Lightweight template library";
    license = lib.licenses.mit;
  };
})
