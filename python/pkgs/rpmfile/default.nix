{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "rpmfile";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-j/xE0V+NK2ytHqiFsJ4cpfF0RTLCRxBVTz/khzUG6do=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "rpmfile" ];

  meta = {
    description = "Read rpm archive files";
    homepage = "https://github.com/srossross/rpmfile";
    license = lib.licenses.mit;
  };
})
