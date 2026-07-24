{
  lib,
  buildPythonPackage,
  fetchPypi,
  changelog-chug,
  docutils,
  lockfile,
  packaging,
  testscenarios,
  testtools,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-daemon";
  version = "3.1.2";
  pyproject = true;

  src = fetchPypi {
    pname = "python_daemon";
    inherit version;
    hash = "sha256-97BDNa3Ec96Hf1EX4m1fEUL0yffNdlQI8Id3V75a+/Q=";
  };

  build-system = [
    changelog-chug
    setuptools
    packaging
  ];

  dependencies = [
    docutils
    lockfile
  ];
  pythonImportsCheck = [
    "daemon"
    "daemon.daemon"
    "daemon.pidfile"
  ];

  meta = {
    description = "Library to implement a well-behaved Unix daemon process";
    homepage = "https://pagure.io/python-daemon/";
    # See "Copying" section in https://pagure.io/python-daemon/blob/main/f/README
    license = with lib.licenses; [
      gpl3Plus
      asl20
    ];
    maintainers = [ ];
  };
}
