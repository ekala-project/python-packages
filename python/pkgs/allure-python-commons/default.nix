{
  lib,
  fetchPypi,
  buildPythonPackage,
  attrs,
  pluggy,
  six,
  allure-python-commons-test,
  setuptools-scm,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "allure-python-commons";
  version = "2.16.2";
  pyproject = true;

  src = fetchPypi {
    pname = "allure_python_commons";
    inherit (finalAttrs) version;
    hash = "sha256-LfhxMa5cvZQeZWpWJhAAGJhi68tx5MRDWHnuKnwH2qE=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "setuptools_scm<10" "setuptools_scm"
  '';

  build-system = [ setuptools-scm ];

  dependencies = [
    attrs
    pluggy
  ];

  pythonImportsCheck = [
    "allure"
    "allure_commons"
  ];

  meta = {
    description = "Common engine for all modules. It is useful for make integration with your homemade frameworks";
    homepage = "https://github.com/allure-framework/allure-python";
    license = lib.licenses.asl20;
  };
})
