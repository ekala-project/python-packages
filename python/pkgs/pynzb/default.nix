{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pynzb";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BzWziJoRdLu2VBjuUDYp0/Xkpj8EsW9G/7oYJT7D7xc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pynzb" ];

  meta = {
    description = "Unified API for parsing NZB files";
    homepage = "https://github.com/ericflo/pynzb";
    license = lib.licenses.bsd3;
  };
}
