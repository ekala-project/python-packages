{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sybil";
  version = "9.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hH0dF7ioV8S7P4RxtKV7iv+pOaYPv1B+cKpyrXkJfAU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "sybil" ];

  meta = {
    description = "Document testing framework";
    homepage = "https://github.com/simplistix/sybil";
    license = lib.licenses.mit;
  };
}
