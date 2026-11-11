{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "deepmerge";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-lIVl8ryc20Elmkoj0mY45YQMnghKNDqyef/T7c/fdNM=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "deepmerge" ];

  meta = {
    description = "Toolset to deeply merge python dictionaries";
    homepage = "https://github.com/toumorokoshi/deepmerge";
    license = lib.licenses.mit;
  };
})
