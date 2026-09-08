{
  lib,
  astroid,
  buildPythonPackage,
  dill,
  fetchFromGitHub,
  isort,
  mccabe,
  platformdirs,
  setuptools,
  tomlkit,
}:

buildPythonPackage (finalAttrs: {
  pname = "pylint";
  version = "4.0.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pylint-dev";
    repo = "pylint";
    tag = "v${finalAttrs.version}";
    hash = "sha256-bCvI5iU3c95v8NzveNdPLH+CYd0lelqLL1Ed7F1t6WY=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "astroid" ];

  dependencies = [
    astroid
    dill
    isort
    mccabe
    platformdirs
    tomlkit
  ];

  pythonImportsCheck = [ "pylint" ];

  meta = {
    description = "Bug and style checker for Python";
    homepage = "https://pylint.readthedocs.io/en/stable/";
    longDescription = ''
      Pylint is a Python static code analysis tool which looks for programming errors,
      helps enforcing a coding standard, sniffs for code smells and offers simple
      refactoring suggestions.
      Pylint is shipped with following additional commands:
      - pyreverse: an UML diagram generator
      - symilar: an independent similarities checker
      - epylint: Emacs and Flymake compatible Pylint
    '';
    license = lib.licenses.gpl2Plus;
    mainProgram = "pylint";
  };
})
