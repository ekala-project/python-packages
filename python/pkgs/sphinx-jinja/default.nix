{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  poetry-core,
  sphinx,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinx-jinja";
  version = "2.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-xiMrWaiUE5dwvh3G0LAKN55CiM54FXkE4fhHPeo+Bxg=";
  };

  build-system = [ poetry-core ];

  dependencies = [ sphinx ];

  # upstream source is not updated to 2.0.X and pypi does not contain tests

  pythonImportsCheck = [ "sphinx_jinja" ];

  meta = {
    description = "Sphinx extension to include jinja templates in documentation";
    homepage = "https://github.com/tardyp/sphinx-jinja";
    license = lib.licenses.mit;
  };
})
