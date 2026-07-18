{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  docutils,
}:

buildPythonPackage {
  pname = "rst2ansi";
  version = "0.1.5-unstable-2025-02-12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Snaipe";
    repo = "python-rst2ansi";
    rev = "3728e16f8b8b1dc338e5df90ba2c4a93ee054b3f";
    hash = "sha256-V7tl/YJcPvEgBfH334t6CU7OXKQqBqRo/zZPiOlyCmE=";
  };

  build-system = [ setuptools ];

  dependencies = [ docutils ];

  pythonImportsCheck = [ "rst2ansi" ];

  meta = {
    description = "Rst converter to ansi-decorated console output";
    mainProgram = "rst2ansi";
    homepage = "https://github.com/Snaipe/python-rst-to-ansi";
    license = lib.licenses.mit;
  };
}
