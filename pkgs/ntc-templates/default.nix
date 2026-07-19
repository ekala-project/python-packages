{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  textfsm,
}:

buildPythonPackage rec {
  pname = "ntc-templates";
  version = "8.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "networktocode";
    repo = "ntc-templates";
    tag = "v${version}";
    hash = "sha256-J1Icf9UG5IMYBH90Mfxd+p+rk57z2OXQENnoRAaepN4=";
  };

  build-system = [ poetry-core ];

  dependencies = [ textfsm ];

  pythonImportsCheck = [ "ntc_templates" ];

  meta = {
    description = "TextFSM templates for parsing show commands of network devices";
    homepage = "https://github.com/networktocode/ntc-templates";
    license = lib.licenses.asl20;
  };
}
