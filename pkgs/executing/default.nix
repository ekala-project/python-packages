{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "executing";
  version = "2.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alexmojaki";
    repo = "executing";
    rev = "v${version}";
    hash = "sha256-UlXuXBW9TmJ0xG/0yMdx8EDQDSzVgtsgFJIj/O7pmio=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "executing" ];

  meta = {
    description = "Get information about what a frame is currently doing, particularly the AST node being executed";
    homepage = "https://github.com/alexmojaki/executing";
    license = lib.licenses.mit;
  };
}
