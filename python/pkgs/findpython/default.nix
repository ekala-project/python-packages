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
  version = "0.9.0";
in
buildPythonPackage {
  inherit pname version;
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SXxrXrE3NL4lQt+2qTJnlGM5YBy8LxE4yM1NQDEf7+U=";
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
  };
}
