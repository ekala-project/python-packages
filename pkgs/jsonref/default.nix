{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pdm-backend,
  pdm-pep517,
}:

buildPythonPackage rec {
  pname = "jsonref";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gazpachoking";
    repo = "jsonref";
    tag = "v${version}";
    hash = "sha256-tOhabmqCkktJUZjCrzjOjUGgA/X6EVz0KqehyLtigfc=";
  };

  build-system = [
    pdm-backend
    pdm-pep517
  ];

  pythonImportsCheck = [ "jsonref" ];

  meta = {
    description = "Implementation of JSON Reference for Python";
    homepage = "https://github.com/gazpachoking/jsonref";
    license = lib.licenses.mit;
  };
}
