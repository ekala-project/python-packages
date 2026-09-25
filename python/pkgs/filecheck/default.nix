{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "filecheck";
  version = "1.0.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AntonLydike";
    repo = "filecheck";
    tag = "v${version}";
    hash = "sha256-+UbfzCOEwwksgh0olZguD5iucdVPJQZMJnNM0135wuA=";
  };

  build-system = [ hatchling ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "filecheck" ];

  meta = {
    homepage = "https://github.com/antonlydike/filecheck";
    license = lib.licenses.asl20;
    description = "Python-native clone of LLVMs FileCheck tool";
    mainProgram = "filecheck";
  };
}
