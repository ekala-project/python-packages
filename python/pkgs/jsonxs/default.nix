{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage {
  pname = "jsonxs";
  version = "0.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fboender";
    repo = "jsonxs";
    rev = "v0.6";
    hash = "sha256-CmKK+qStb9xjmEACY41tQnffD4cMUUQPb74Cni5FTEk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "jsonxs" ];

  meta = {
    description = "Python library that uses path expression strings to get and set values in JSON";
    homepage = "https://github.com/fboender/jsonxs";
    license = lib.licenses.mit;
  };
}
