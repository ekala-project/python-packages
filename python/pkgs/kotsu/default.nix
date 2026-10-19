{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pandas,
  typing-extensions,
  pytestCheckHook,
  pytest-cov-stub,
  pytest-mock,
  scikit-learn,
}:

buildPythonPackage (finalAttrs: {
  pname = "kotsu";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "datavaluepeople";
    repo = "kotsu";
    tag = "v${finalAttrs.version}";
    hash = "sha256-7bRrHowRKq3xiBiAkfS4ZL9PXHIUmZc99q9pHex9BLg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pandas
    typing-extensions
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-cov-stub
    pytest-mock
    scikit-learn
  ];
  pythonImportsCheck = [ "kotsu" ];

  meta = {
    description = "Lightweight framework for structured and repeatable model validation";
    homepage = "https://github.com/datavaluepeople/kotsu";
    license = lib.licenses.mit;
  };
})
