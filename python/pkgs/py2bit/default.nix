{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "py2bit";
  version = "0.3.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Jk9b/DnXKfGsrVTHYKwE+oog1BhPS1BdnDM9LgMlN3A=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  meta = {
    homepage = "https://github.com/deeptools/py2bit";
    description = "File access to 2bit files";
    license = lib.licenses.mit;
  };
}
