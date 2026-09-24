{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  build,
  cachecontrol,
  cleo,
  dulwich,
  fastjsonschema,
  findpython,
  installer,
  keyring,
  packaging,
  pbs-installer,
  pkginfo,
  platformdirs,
  poetry-core,
  pyproject-hooks,
  requests,
  requests-toolbelt,
  shellingham,
  tomlkit,
  trove-classifiers,
  virtualenv,
  xattr,
}:

buildPythonPackage rec {
  pname = "poetry";
  version = "2.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-poetry";
    repo = "poetry";
    tag = version;
    hash = "sha256-Mb1etVmBm542q7FrcMU6pzXdMUDQSpI8DFg/gbOiG4U=";
  };

  build-system = [ poetry-core ];

  dependencies =
    [
      build
      cachecontrol
      cleo
      dulwich
      fastjsonschema
      findpython
      installer
      keyring
      packaging
      pbs-installer
      pkginfo
      platformdirs
      poetry-core
      pyproject-hooks
      requests
      requests-toolbelt
      shellingham
      tomlkit
      trove-classifiers
      virtualenv
    ]
    ++ lib.optionals stdenv.hostPlatform.isDarwin [ xattr ]
    ++ cachecontrol.optional-dependencies.filecache
    ++ pbs-installer.optional-dependencies.download
    ++ pbs-installer.optional-dependencies.install;

  pythonRelaxDeps = [ "installer" ];

  pythonNamespaces = [ "poetry" ];

  makeWrapperArgs = [ "--unset PYTHONPATH" ];

  meta = {
    description = "Python dependency management and packaging made easy";
    homepage = "https://python-poetry.org/";
    license = lib.licenses.mit;
    mainProgram = "poetry";
  };
}
