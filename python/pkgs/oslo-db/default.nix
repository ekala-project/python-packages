{ lib
, buildPythonPackage
, fetchPypi
, alembic
, debtcollector
, oslo-config
, oslo-i18n
, oslo-utils
, pbr
, setuptools
, sqlalchemy
, stevedore
,
}:

buildPythonPackage rec {
  pname = "oslo-db";
  version = "18.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "oslo_db";
    inherit version;
    hash = "sha256-B16GziPAwh2x01CR8dyyGwVEnInDpDJtpPLT+4MwIj8=";
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
  ];
  pythonImportsCheck = [ "oslo_db" ];

  meta = {
    description = "Oslo Database library";
    homepage = "https://github.com/openstack/oslo.db";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
