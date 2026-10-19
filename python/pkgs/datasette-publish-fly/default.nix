{
  lib,
  buildPythonPackage,
  cogapp,
  datasette,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytest-mock,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "datasette-publish-fly";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "simonw";
    repo = "datasette-publish-fly";
    tag = finalAttrs.version;
    hash = "sha256-diaxr+fNNgkJvLGkLo+lK0ThTsXYDePFsvTetMbDRMk=";
  };

  build-system = [ setuptools ];

  dependencies = [ datasette ];

  nativeCheckInputs = [
    cogapp
    pytest-mock
    pytestCheckHook
  ];

  pythonImportsCheck = [ "datasette_publish_fly" ];

  meta = {
    description = "Datasette plugin for publishing data using Fly";
    homepage = "https://datasette.io/plugins/datasette-publish-fly";
    license = lib.licenses.asl20;
  };
})
