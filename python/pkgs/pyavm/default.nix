{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyavm";
  version = "0.9.9";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-vA9gXZV8H9bXdlUj/LqLmnI3esbFFGHCqDj+RGALzZo=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "pyavm" ];

  meta = {
    description = "Simple pure-python AVM meta-data handling";
    homepage = "https://astrofrog.github.io/pyavm/";
    license = lib.licenses.mit;
  };
})
