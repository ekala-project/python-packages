{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "luxtronik";
  version = "0.3.14";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Bouni";
    repo = "python-luxtronik";
    tag = version;
    hash = "sha256-7TuvqOAb/MUumOF6BKTRLOJuvteqZPmFUXXsuwEpmOM=";
  };

  build-system = [ setuptools ];

  # Project has no tests

  pythonImportsCheck = [ "luxtronik" ];

  meta = {
    description = "Python library to interact with Luxtronik heatpump controllers";
    homepage = "https://github.com/Bouni/python-luxtronik";
    license = lib.licenses.mit;
  };
}
