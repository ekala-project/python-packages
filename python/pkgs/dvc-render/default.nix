{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  flatten-dict,
  funcy,
  matplotlib,
  tabulate,
  pytest-mock,
  pytest-test-utils,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "dvc-render";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "iterative";
    repo = "dvc-render";
    tag = finalAttrs.version;
    hash = "sha256-V4QVZu4PSOW9poT6YUWbgTjJpIJ8YUtGDAE4Ijgm5Ac=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  passthru.optional-dependencies = {
    table = [
      flatten-dict
      tabulate
    ];
    markdown = [
      tabulate
      matplotlib
    ];
  };
  disabledTestPaths = lib.optionals stdenv.hostPlatform.isDarwin [ "tests/test_vega.py" ];

  pythonImportsCheck = [ "dvc_render" ];

  meta = {
    description = "Library for rendering DVC plots";
    homepage = "https://github.com/iterative/dvc-render";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
