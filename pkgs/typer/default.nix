{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pdm-backend,
  annotated-doc,
  click,
  rich,
  shellingham,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "typer";
  version = "0.24.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fastapi";
    repo = "typer";
    tag = version;
    hash = "sha256-ha/cT2+I9/WUjb7ZXSKqLSocZ3vq0N1fm4RvRpsXIDc=";
  };

  env.TIANGOLO_BUILD_PACKAGE = "typer";

  build-system = [ pdm-backend ];

  dependencies = [
    annotated-doc
    click
    rich
    shellingham
    typing-extensions
  ];

  pythonImportsCheck = [ "typer" ];

  meta = {
    description = "Library for building CLI applications";
    homepage = "https://typer.tiangolo.com/";
    license = lib.licenses.mit;
  };
}
