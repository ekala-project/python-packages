{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,

  # build-system
  setuptools,

  # optional-dependencies
  coverage,

  # tests
  unittestCheckHook,
}:

buildPythonPackage rec {
  pname = "nose2";
  version = "0.16.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Gdta0g4mRQGo7mTj4VejdmpedEFw5Uzuy05coJsIZVo=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    coverage_plugin = [ coverage ];
  };

  pythonImportsCheck = [ "nose2" ];

  __darwinAllowLocalNetworking = true;

  nativeCheckInputs = [
    unittestCheckHook
  ];

  meta = {
    description = "Test runner for Python";
    mainProgram = "nose2";
    homepage = "https://github.com/nose-devs/nose2";
    license = lib.licenses.bsd0;
    maintainers = [ ];
  };
}
