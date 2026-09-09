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
  version = "0.27.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fastapi";
    repo = "typer";
    tag = version;
    hash = "sha256-vBHSJoyIQawkqqhbPJGKzPjBPm42OR/Ref/k6XFJTi8=";
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
