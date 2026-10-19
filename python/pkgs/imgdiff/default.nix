{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pillow,
  mock,
  unittestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "imgdiff";
  version = "1.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mgedmin";
    repo = "imgdiff";
    tag = finalAttrs.version;
    hash = "sha256-Ko2m6rLKUmRveHIeIylGWFXyDwlf3E7mkNHKxk7HBbA=";
  };

  build-system = [ setuptools ];

  dependencies = [ pillow ];

  pythonImportsCheck = [ "imgdiff" ];

  nativeCheckInputs = [
    mock
    unittestCheckHook
  ];

  meta = {
    description = "Compare two images side-by-side";
    mainProgram = "imgdiff";
    homepage = "https://github.com/mgedmin/imgdiff";
    license = lib.licenses.mit;
  };
})
