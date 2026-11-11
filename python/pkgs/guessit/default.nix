{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  rebulk,
  babelfish,
  python-dateutil,
}:

buildPythonPackage (finalAttrs: {
  pname = "guessit";
  version = "4.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-3wnyvW9Ksk63lgQiKSzCMyvnvX0zj/FFEbnRF0p444M=";
  };

  build-system = [ hatchling ];

  # rebulk 6.0.2 is not packaged yet
  pythonRelaxDeps = [ "rebulk" ];

  dependencies = [
    rebulk
    babelfish
    python-dateutil
  ];

  pythonImportsCheck = [ "guessit" ];

  meta = {
    description = "Python library that extracts as much information as possible from a video filename";
    homepage = "https://guessit-io.github.io/guessit/";
    license = lib.licenses.lgpl3Only;
  };
})
