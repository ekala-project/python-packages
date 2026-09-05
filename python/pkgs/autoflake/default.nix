{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  pyflakes,
}:
buildPythonPackage rec {
  pname = "autoflake";
  version = "2.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-73xJbZvOnSzvBJ8k5ILR0wkMN/vUTl6F37ANs8eO4Ww=";
  };

  nativeBuildInputs = [ hatchling ];

  propagatedBuildInputs = [ pyflakes ];
  pythonImportsCheck = [ "autoflake" ];
  meta = {
    description = "Tool to remove unused imports and unused variables";
    mainProgram = "autoflake";
    homepage = "https://github.com/myint/autoflake";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
