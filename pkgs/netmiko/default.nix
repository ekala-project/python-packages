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

buildPythonPackage rec {
  pname = "netmiko";
  version = "4.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lwG7LBoV6y6AdMsuKMoAfGm5+lKWG4O5jHV+rWuA3u8=";
  };

  build-system = [ poetry-core ];

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
}
