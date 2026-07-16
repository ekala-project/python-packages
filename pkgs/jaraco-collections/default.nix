{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  jaraco-classes,
  jaraco-text,
}:

buildPythonPackage rec {
  pname = "jaraco-collections";
  version = "5.2.1";
  pyproject = true;

  src = fetchPypi {
    pname = "jaraco_collections";
    inherit version;
    hash = "sha256-2rgZcLrW8KtTsgdF8bAdo3km5MD81CUEaqReDY76GO0=";
  };

  postPatch = ''
    sed -i "/coherent\.licensed/d" pyproject.toml
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    jaraco-classes
    jaraco-text
  ];

  pythonNamespaces = [ "jaraco" ];

  pythonImportsCheck = [ "jaraco.collections" ];

  meta = {
    homepage = "https://github.com/jaraco/jaraco.collections";
    description = "Models and classes to supplement the stdlib 'collections' module";
    license = lib.licenses.mit;
  };
}
