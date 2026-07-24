{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
  click,
}:

buildPythonPackage rec {
  pname = "cloup";
  version = "3.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Y3weYo/pjz8gpeRNpZGnK0K/VNfUUnGQvzntX2SvdYU=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [ click ];

  pythonImportsCheck = [ "cloup" ];

  meta = {
    description = "Click extended with option groups, constraints, aliases, help themes";
    homepage = "https://github.com/janLuke/cloup";
    license = lib.licenses.bsd3;
  };
}
