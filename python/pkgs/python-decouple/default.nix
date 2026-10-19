{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  mock,
}:

buildPythonPackage rec {
  pname = "python-decouple";
  version = "3.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "HBNetwork";
    repo = "python-decouple";
    tag = "v${version}";
    hash = "sha256-F9Gu7Y/dJhwOJi/ZaoVclF3+4U/N5JdvpXwgGB3SF3Q=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "decouple" ];

  meta = {
    description = "Module to handle code and condifuration";
    homepage = "https://github.com/HBNetwork/python-decouple";
    license = lib.licenses.mit;
  };
}
