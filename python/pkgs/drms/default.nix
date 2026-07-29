{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  numpy,
  pandas,
  packaging,

  astropy,
  pytestCheckHook,
  pytest-doctestplus,
}:

buildPythonPackage (finalAttrs: {
  pname = "drms";
  version = "0.9.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "sunpy";
    repo = "drms";
    tag = "v${finalAttrs.version}";
    hash = "sha256-f5t59a24aD8iXa3/zikgBnJeuUnZ4cvvpJuOfc80Xcw=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    numpy
    pandas
    packaging
  ];

  nativeCheckInputs = [
    astropy
    pytestCheckHook
    pytest-doctestplus
  ];

  disabledTests = [
    "test_query_hexadecimal_strings"
    "test_jsocinfoconstants" # Need network
  ];

  disabledTestPaths = [ "docs/tutorial.rst" ];

  pythonImportsCheck = [ "drms" ];

  meta = {
    description = "Access HMI, AIA and MDI data with Python";
    homepage = "https://github.com/sunpy/drms";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
