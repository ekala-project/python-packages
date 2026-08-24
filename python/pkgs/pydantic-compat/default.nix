{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  gitMinimal,
  importlib-metadata,
  pydantic,
}:

buildPythonPackage rec {
  pname = "pydantic-compat";
  version = "0.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyapp-kit";
    repo = "pydantic-compat";
    tag = "v${version}";
    leaveDotGit = true;
    hash = "sha256-YJUfWu+nyGlwpJpxYghCKzj3CasdAaqYoNVCcfo/7YE=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  nativeBuildInputs = [
    gitMinimal
  ];

  dependencies = [
    importlib-metadata
    pydantic
  ];

  pythonImportsCheck = [ "pydantic_compat" ];

  meta = {
    description = "Compatibility layer for pydantic v1/v2";
    homepage = "https://github.com/pyapp-kit/pydantic-compat";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
