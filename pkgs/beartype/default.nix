{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "beartype";
  version = "0.22.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "beartype";
    repo = "beartype";
    tag = "v${version}";
    hash = "sha256-F9x2qvzll1nUcTQZjaky+0ukP1RXoW35crzfS/pmvTs=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "beartype" ];

  meta = {
    description = "Fast runtime type checking for Python";
    homepage = "https://github.com/beartype/beartype";
    license = lib.licenses.mit;
  };
}
