{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build time
  pdm-backend,

  # runtime
  packaging,
  platformdirs,
}:

let
  pname = "findpython";
  version = "0.8.0";
in
buildPythonPackage {
  inherit pname version;
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-U7MiZIdN+lmQvQnXF4GThtjbMUnYn+IPiP4QeN4oa64=";
  };

  build-system = [ pdm-backend ];

  dependencies = [
    packaging
    platformdirs
  ];
  pythonImportsCheck = [ "findpython" ];

  meta = {
    description = "Utility to find python versions on your system";
    mainProgram = "findpython";
    homepage = "https://github.com/frostming/findpython";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
