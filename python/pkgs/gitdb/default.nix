{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  smmap,
}:

buildPythonPackage rec {
  pname = "gitdb";
  version = "4.0.12";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XvcfhV0ZGjMm/PvA1dqDXyaxP7y6YMMsIQkcNJ/9tXE=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  pythonRelaxDeps = [ "smmap" ];

  propagatedBuildInputs = [ smmap ];

  pythonImportsCheck = [ "gitdb" ];

  meta = {
    description = "Git Object Database";
    homepage = "https://github.com/gitpython-developers/gitdb";
    license = lib.licenses.bsd3;
  };
}
