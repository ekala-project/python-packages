{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "pgpdump";
  version = "1.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-HEcAhXv3unNbCM/kEBqjpPX9g5ZXryScF7JpfCCClmg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pgpdump" ];

  meta = {
    description = "Python library for parsing PGP packets";
    homepage = "https://github.com/toofishes/python-pgpdump";
    license = lib.licenses.bsd3;
  };
}
