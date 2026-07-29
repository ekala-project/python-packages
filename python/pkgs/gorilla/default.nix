{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytestCheckHook,
  pythonAtLeast,
  setuptools,
}:

buildPythonPackage rec {
  pname = "gorilla";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AFq4hTsDcWKnx3u4JGBMbggYeO4DwJrQHvQXRIVgGdM=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "gorilla" ];

  disabledTests = lib.optionals (pythonAtLeast "3.12") [ "test_find_patches_2" ];

  meta = {
    description = "Convenient approach to monkey patching";
    homepage = "https://github.com/christophercrouzet/gorilla";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
