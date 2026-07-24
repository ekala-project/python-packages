{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  textfsm,
}:

buildPythonPackage rec {
  pname = "ntc-templates";
  version = "9.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "networktocode";
    repo = "ntc-templates";
    tag = "v${version}";
    hash = "sha256-iKG1+sc/J+PdFNNmmqCR9xmw7KVuP0P2mNPqHiZDe7M=";
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
