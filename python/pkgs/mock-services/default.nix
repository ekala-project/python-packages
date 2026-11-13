{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,
  attrs,
  funcsigs,
  requests-mock,
  pytestCheckHook,
  setuptools_80,
}:

buildPythonPackage (finalAttrs: {
  pname = "mock-services";
  version = "0.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-sH1RpVsYtzmaLDD9uQCGl98X13F6BK/MyfiWVs6CwZM=";
  };

  patches = [
    # Fix issues due to internal API breaking in latest versions of requests-mock
    (fetchpatch {
      url = "https://github.com/peopledoc/mock-services/commit/88d3a0c9ef4dd7d5e011068ed2fdbbecc4a1a03a.patch";
      sha256 = "0a4pwxr33kr525sp8q4mb4cr3n2b51mj2a3052lhg6brdbi4gnms";
    })
  ];

  build-system = [ setuptools_80 ];

  dependencies = [
    attrs
    funcsigs
    requests-mock
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  disabledTests = [
    # require networking
    "test_real_http_1"
    "test_restart_http_mock"
    "test_start_http_mock"
    "test_stop_http_mock"
  ];

  pythonImportsCheck = [ "mock_services" ];

  meta = {
    description = "Mock an entire service API based on requests-mock";
    homepage = "https://github.com/peopledoc/mock-services";
    license = lib.licenses.mit;
  };
})
