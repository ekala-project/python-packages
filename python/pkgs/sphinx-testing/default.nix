{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  sphinx,
  six,
}:

buildPythonPackage rec {
  pname = "sphinx-testing";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-72YXdbVyLXsA9n/CKRBDF9NWN6T7RDS/LABa/fHaTQk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    sphinx
    six
  ];

  # Test failures https://github.com/sphinx-doc/sphinx-testing/issues/5
  doCheck = false;

  meta = {
    description = "Testing utility classes and functions for Sphinx extensions";
    homepage = "https://github.com/sphinx-doc/sphinx-testing";
    license = lib.licenses.bsd2;
  };
}
