{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pycryptodomex,
  pytestCheckHook,
  requests,
  setuptools,
  xmltodict,
}:

buildPythonPackage rec {
  pname = "huawei-lte-api";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Salamek";
    repo = "huawei-lte-api";
    tag = version;
    hash = "sha256-3EqxZhoMilNa/ffKnER0XabGKMJAzlgipiKLlUN3kFU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pycryptodomex
    requests
    xmltodict
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [
    "huawei_lte_api.Client"
    "huawei_lte_api.Connection"
    "huawei_lte_api.Session"
  ];

  meta = {
    description = "API For huawei LAN/WAN LTE Modems";
    homepage = "https://github.com/Salamek/huawei-lte-api";
    license = lib.licenses.lgpl3Only;
  };
}
