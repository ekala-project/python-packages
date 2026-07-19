{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "jsonpickle";
  version = "4.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iv7RiqGJ/YHi6DO0JrtK9IVZSSHwsdNsIAH8Vjei8hA=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  doCheck = false;

  pythonImportsCheck = [ "jsonpickle" ];

  meta = {
    description = "Python library for serializing any arbitrary object graph into JSON";
    homepage = "https://github.com/jsonpickle/jsonpickle";
    license = lib.licenses.bsd3;
  };
}
