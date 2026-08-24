{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  debtcollector,
  oslo-config,
  oslo-context,
  oslo-serialization,
  oslo-utils,
  pbr,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "oslo-log";
  version = "8.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openstack";
    repo = "oslo.log";
    tag = version;
    hash = "sha256-ThRJ2rfVStnVOwcu8ZaKDjqb4jT6YE+n+iOFtmR8rwQ=";
  };

  # Manually set version because prb wants to get it from the git upstream repository (and we are
  # installing from tarball instead)
  env.PBR_VERSION = version;

  build-system = [ setuptools ];

  dependencies = [
    debtcollector
    oslo-config
    oslo-context
    oslo-serialization
    oslo-utils
    pbr
    python-dateutil
  ];
  pythonImportsCheck = [ "oslo_log" ];

  meta = {
    description = "oslo.log library";
    mainProgram = "convert-json";
    homepage = "https://github.com/openstack/oslo.log";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
