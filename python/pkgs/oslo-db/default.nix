{
  lib,
  buildPythonPackage,
  fetchPypi,
  alembic,
  debtcollector,
  oslo-config,
  oslo-i18n,
  oslo-utils,
  pbr,
  setuptools,
  sqlalchemy,
  stevedore,
  testresources,
  testscenarios,
}:

buildPythonPackage (finalAttrs: {
  pname = "oslo-db";
  version = "18.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "oslo_db";
    inherit (finalAttrs) version;
    hash = "sha256-Ujm6BZuUw4HGG1q+YHrc0V6u6N8RXerduKNtyzZuRPo=";
  };

  build-system = [
    pbr
    setuptools
  ];

  dependencies = [
    alembic
    debtcollector
    oslo-config
    oslo-i18n
    oslo-utils
    sqlalchemy
    stevedore
    testresources
    testscenarios
  ];
  pythonImportsCheck = [ "oslo_db" ];

  meta = {
    description = "Oslo Database library";
    homepage = "https://github.com/openstack/oslo.db";
    license = lib.licenses.asl20;
  };
})
