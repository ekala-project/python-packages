{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  runCommand,
  # build-system
  setuptools,
  setuptools-scm,
  # dependencies
  dbus-python,
  # checks
  doCheck ? true,
  dbus,
  bluez,
}:

let
  # Cannot just add it to path in preCheck since that attribute will be passed to
  # mkDerivation even with doCheck = false, causing a dependency cycle.
  pbap-client = runCommand "pbap-client" { } ''
    mkdir -p "$out/bin"
    ln -s "${bluez.test}/test/pbap-client" "$out/bin/pbap-client"
  '';
in
buildPythonPackage rec {
  pname = "python-dbusmock";
  version = "0.37.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "martinpitt";
    repo = "python-dbusmock";
    tag = version;
    hash = "sha256-Q149NcbpbIgXCd7WujALC9I9vAM/tZh+enTJh0d84Kg=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ dbus-python ];

  inherit doCheck;

  meta = {
    description = "Mock D-Bus objects for tests";
    homepage = "https://github.com/martinpitt/python-dbusmock";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
