{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "graphemeu";
  version = "0.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "timendum";
    repo = "grapheme";
    tag = "v${finalAttrs.version}";
    hash = "sha256-qDspbeOmlfQ4VLPdKEuxNPYilKjwUcAJiEOMfx9fFlI=";
  };

  build-system = [ hatchling ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "grapheme" ];

  meta = {
    description = "Python package for grapheme aware string handling";
    homepage = "https://github.com/timendum/grapheme";
    changelog = "https://github.com/timendum/grapheme/blob/v${finalAttrs.version}/CHANGELOG.md";
    license = lib.licenses.mit;
  };
})
