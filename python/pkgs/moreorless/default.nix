{
  lib,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  parameterized,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "moreorless";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "thatch";
    repo = "moreorless";
    tag = "v${finalAttrs.version}";
    hash = "sha256-uFcNjQLr/rO2hf2ujWWSsOVxfwgAeIxDZ0yskOfBSe4=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [ click ];
  pythonImportsCheck = [ "moreorless" ];

  meta = {
    description = "Wrapper to make difflib.unified_diff more fun to use";
    homepage = "https://github.com/thatch/moreorless/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
