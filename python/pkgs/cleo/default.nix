{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  crashtest,
  poetry-core,
  rapidfuzz,
}:

buildPythonPackage rec {
  pname = "cleo";
  version = "2.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-poetry";
    repo = "cleo";
    tag = version;
    hash = "sha256-+OvE09hbF6McdXpXdv5UBdZ0LiSOTL8xyE/+bBNIFNk=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  pythonRelaxDeps = [ "rapidfuzz" ];

  propagatedBuildInputs = [
    crashtest
    rapidfuzz
  ];

  pythonImportsCheck = [
    "cleo"
    "cleo.application"
    "cleo.commands.command"
    "cleo.helpers"
  ];
  meta = {
    homepage = "https://github.com/python-poetry/cleo";
    description = "Allows you to create beautiful and testable command-line interfaces";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
