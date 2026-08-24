{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  # build-system
  hatchling,
  hatch-vcs,
  # dependencies
  pyudev,
}:

buildPythonPackage rec {
  pname = "rtslib-fb";
  version = "2.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "open-iscsi";
    repo = "rtslib-fb";
    tag = "v${version}";
    hash = "sha256-iDnirxx+gY2vg63IevI7qmfi4l79QXaKQc/TckjG7xE=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    pyudev
  ];

  # No tests

  meta = {
    description = "Python object API for managing the Linux LIO kernel target";
    homepage = "https://github.com/open-iscsi/rtslib-fb";
    license = lib.licenses.asl20;
    platforms = lib.platforms.linux;
    mainProgram = "targetctl";
  };
}
