{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatch-argparse-manpage,
  hatchling,

  # dependencies
  packaging,
  pyxdg,
}:

buildPythonPackage (finalAttrs: {
  pname = "show-in-file-manager";
  version = "1.1.6";
  pyproject = true;

  src = fetchPypi {
    pname = "show_in_file_manager";
    inherit (finalAttrs) version;
    hash = "sha256-VZtZbj5WOADPadc0zSNoJCeanYINHYQWQMXxPgBY+bY=";
  };

  build-system = [
    hatch-argparse-manpage
    hatchling
  ];

  dependencies = [ packaging ] ++ lib.optional stdenv.hostPlatform.isLinux pyxdg;

  pythonImportsCheck = [ "showinfm" ];

  meta = {
    description = "Open the system file manager and select files in it";
    homepage = "https://github.com/damonlynch/showinfilemanager";
    license = lib.licenses.mit;
    mainProgram = "showinfilemanager";
  };
})
