{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wrapt,
}:

buildPythonPackage rec {
  pname = "deprecated";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tantale";
    repo = "deprecated";
    tag = "v${version}";
    hash = "sha256-1mB9aRZOsaW7Mqcu1SWIYTusQ7MlMvUucdTyfu++Nx8=";
  };

  build-system = [ setuptools ];

  propagatedBuildInputs = [ wrapt ];

  pythonImportsCheck = [ "deprecated" ];

  meta = {
    homepage = "https://github.com/tantale/deprecated";
    description = "Python @deprecated decorator to deprecate old python classes, functions or methods";
    license = lib.licenses.mit;
  };
}
