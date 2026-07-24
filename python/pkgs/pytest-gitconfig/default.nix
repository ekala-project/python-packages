{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pdm-backend,
  pkgs,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-gitconfig";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "noirbizarre";
    repo = "pytest-gitconfig";
    tag = finalAttrs.version;
    hash = "sha256-z3W9AL74i47k/eYCbFMn3foVaD2h7lFrGzyOnbDwkyc=";
  };

  build-system = [ pdm-backend ];

  buildInput = [ pytest ];
  pythonImportsCheck = [ "pytest_gitconfig" ];

  meta = {
    description = "Pytest gitconfig sandbox";
    homepage = "https://github.com/noirbizarre/pytest-gitconfig";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
