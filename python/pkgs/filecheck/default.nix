{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "filecheck";
  version = "1.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AntonLydike";
    repo = "filecheck";
    tag = "v${version}";
    hash = "sha256-oOGQIEPIHL4xQRVKOw+8Z8QSowXlavVnck+IOWA9qd8=";
  };

  build-system = [ poetry-core ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "filecheck" ];

  meta = {
    homepage = "https://github.com/antonlydike/filecheck";
    license = lib.licenses.asl20;
    description = "Python-native clone of LLVMs FileCheck tool";
    mainProgram = "filecheck";
    maintainers = [ ];
  };
}
