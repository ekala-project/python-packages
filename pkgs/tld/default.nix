{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "tld";
  version = "0.13.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2YP6krnXF0AHQvyoROKdXhgnEHnHvPq/ZtAbObShQ0U=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "tld" ];

  meta = {
    description = "Extracts the top level domain (TLD) from the URL given";
    homepage = "https://github.com/barseghyanartur/tld";
    license = lib.licenses.lgpl21Plus;
  };
}
