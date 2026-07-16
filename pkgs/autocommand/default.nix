{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "autocommand";
  version = "2.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-h43pQjxVlkkRZyJcKkVQQ8MTD7W3KGrINEPUXnSVXzQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "autocommand" ];

  meta = {
    homepage = "https://github.com/Lucretiel/autocommand";
    description = "Autocommand turns a python function into a CLI program";
    license = lib.licenses.lgpl3Only;
  };
}
