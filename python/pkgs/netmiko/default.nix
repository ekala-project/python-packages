{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
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
  version = "4.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-YmTPivy9nBDvuDK6yruaiTcEUtUi9sIFMtKtD+/L3Wk=";
  };

  build-system = [ hatchling ];

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
