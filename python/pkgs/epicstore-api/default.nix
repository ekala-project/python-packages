{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  pytestCheckHook,
  cloudscraper,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "epicstore-api";
  version = "0.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "SD4RK";
    repo = "epicstore_api";
    tag = "v_${finalAttrs.version}";
    hash = "sha256-XSynUz8rAl/+jcPMCZoVKlGZLVcTCAr36VEWVhAydoM=";
  };

  build-system = [ setuptools ];

  dependencies = [ cloudscraper ];

  pythonImportsCheck = [ "epicstore_api" ];

  nativeCheckInputs = [ pytestCheckHook ];

  # tests directory exists but contains no test cases

  meta = {
    description = "Epic Games Store Web API Wrapper written in Python";
    homepage = "https://github.com/SD4RK/epicstore_api";
    license = lib.licenses.mit;
  };
})
