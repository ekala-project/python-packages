{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "art";
  version = "6.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sepandhaghighi";
    repo = "art";
    tag = "v${version}";
    hash = "sha256-ub+hvxYRZznql/GZjA6QXrdHUbM+QCVEYiQfQ6IOJKE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "art" ];

  meta = {
    description = "ASCII art library for Python";
    homepage = "https://github.com/sepandhaghighi/art";
    license = lib.licenses.mit;
  };
}
