{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,

  # build-system
  argparse-manpage,
  setuptools,

  # dependencies
  packaging,
  pyxdg,
}:

buildPythonPackage rec {
  pname = "show-in-file-manager";
  version = "1.1.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7ROhgKHUj9iP3UxYv7yzhgJoZBo4gFGSyBTUE4cZLYQ=";
  };

  build-system = [
    argparse-manpage
    setuptools
  ];

  dependencies = [ packaging ] ++ lib.optional stdenv.hostPlatform.isLinux pyxdg;

  pythonImportsCheck = [ "showinfm" ];

  meta = {
    description = "Open the system file manager and select files in it";
    homepage = "https://github.com/damonlynch/showinfilemanager";
    license = lib.licenses.mit;
    mainProgram = "showinfilemanager";
  };
}
