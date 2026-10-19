{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  ntc-templates,
  paramiko,
  pyserial,
  pyyaml,
  rich,
  ruamel-yaml,
  scp,
  textfsm,
}:

buildPythonPackage (finalAttrs: {
  pname = "netmiko";
  version = "4.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-lM97/l2u0dBYREzhY34QF33yL5A2g6U9H77kdVNIjGU=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [ "paramiko" ];

  dependencies = [
    ntc-templates
    paramiko
    pyserial
    pyyaml
    rich
    ruamel-yaml
    scp
    textfsm
  ];

  pythonImportsCheck = [ "netmiko" ];

  meta = {
    description = "Multi-vendor library to simplify Paramiko SSH connections to network devices";
    homepage = "https://github.com/ktbyers/netmiko/";
    license = lib.licenses.mit;
  };
})
