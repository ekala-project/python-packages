{
  lib,
  astroid,
  buildPythonPackage,
  fetchFromGitHub,
  packaging,
  poetry-core,
  semver,
  pythonOlder,
}:

buildPythonPackage (finalAttrs: {
  pname = "requirements-detector";
  version = "1.6.0";
  pyproject = true;

  disabled = pythonOlder "3.12";

  src = fetchFromGitHub {
    owner = "prospector-dev";
    repo = "requirements-detector";
    tag = finalAttrs.version;
    hash = "sha256-AdKVZUb3MTxh6mRJly0xcCm6ogu83m0IsKcamSUup7M=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    astroid
    packaging
    semver
  ];

  pythonImportsCheck = [ "requirements_detector" ];

  meta = {
    description = "Python tool to find and list requirements of a Python project";
    homepage = "https://github.com/prospector-dev/requirements-detector";
    license = lib.licenses.mit;
    mainProgram = "detect-requirements";
  };
})
