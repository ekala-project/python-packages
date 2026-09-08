{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "sh";
  version = "2.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-olCu9oUJ7ZNBnJodkLBkfNXL4mEHupTTcX71ttWV/9k=";
  };

  build-system = [ hatchling ];

  doCheck = false;

  pythonImportsCheck = [ "sh" ];

  meta = {
    description = "Python subprocess interface";
    homepage = "https://pypi.org/project/sh/";
    license = lib.licenses.mit;
  };
}
