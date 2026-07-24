{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "aniso8601";
  version = "10.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-JUiPhmPdFSiuH1T5SsHqUa4ltNUxU5uLxwf+0YTRaEU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "aniso8601" ];

  meta = {
    description = "Python Parser for ISO 8601 strings";
    homepage = "https://bitbucket.org/nielsenb/aniso8601";
    license = lib.licenses.bsd3;
  };
}
