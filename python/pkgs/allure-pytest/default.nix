{
  lib,
  allure-python-commons,
  buildPythonPackage,
  fetchFromGitHub,
  pytest,
  setuptools_80,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "allure-pytest";
  version = "2.15.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "allure-framework";
    repo = "allure-python";
    tag = finalAttrs.version;
    hash = "sha256-06SKodvyoT0mYn4RmAIryZc+VyTI79KXFK+2/zuhzQ0=";
  };

  sourceRoot = "${finalAttrs.src.name}/allure-pytest";

  pythonRelaxDeps = [ "allure-python-commons" ];

  build-system = [
    setuptools_80
    setuptools-scm
  ];

  buildInputs = [ pytest ];

  dependencies = [ allure-python-commons ];

  # Tests were moved to the meta package

  pythonImportsCheck = [ "allure_pytest" ];

  meta = {
    description = "Allure integrations for Python test frameworks";
    homepage = "https://github.com/allure-framework/allure-python";
    license = lib.licenses.asl20;
  };
})
