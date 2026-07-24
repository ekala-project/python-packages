{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  docutils,
  six,
}:

buildPythonPackage rec {
  pname = "bcdoc";
  version = "0.16.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9WjBguBog77PcZbyJwUkNc/9RWBHAMgjYsp300J7YgI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    docutils
    six
  ];

  pythonImportsCheck = [ "bcdoc" ];

  meta = {
    description = "ReST document generation tools for botocore";
    homepage = "https://github.com/boto/bcdoc";
    license = lib.licenses.asl20;
  };
}
