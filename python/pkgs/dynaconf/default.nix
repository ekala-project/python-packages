{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "dynaconf";
  version = "3.2.13";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dynaconf";
    repo = "dynaconf";
    tag = version;
    hash = "sha256-3qUGLEQ0x/WTF/M/SEts6v9w1yGYSB6LYEcxKQcbqSk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dynaconf" ];

  meta = {
    description = "Dynamic configurator for Python Project";
    homepage = "https://github.com/dynaconf/dynaconf";
    mainProgram = "dynaconf";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
