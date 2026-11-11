{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  jaraco-context,
  jaraco-functools,
  more-itertools,
  typer,

  # optional-dependencies
  inflect,
}:

buildPythonPackage (finalAttrs: {
  pname = "jaraco-text";
  version = "4.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jaraco_text";
    inherit (finalAttrs) version;
    hash = "sha256-3dXrYlnQcB4Iy2QsjWtjvMc5R9A9+SOepnu++RGz5OE=";
  };

  # coherent.licensed is only used to infer license metadata, which is already declared
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"coherent.licensed",' ""
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    jaraco-context
    jaraco-functools
    more-itertools
    typer
  ];

  # typer-slim is typer without optional extras
  pythonRemoveDeps = [ "typer-slim" ];

  optional-dependencies = {
    inflect = [ inflect ];
  };

  pythonNamespaces = [ "jaraco" ];

  pythonImportsCheck = [ "jaraco.text" ];

  meta = {
    homepage = "https://github.com/jaraco/jaraco.text";
    description = "Module for text manipulation";
    license = lib.licenses.mit;
  };
})
