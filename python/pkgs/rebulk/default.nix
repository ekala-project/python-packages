{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  regex,
}:

buildPythonPackage rec {
  pname = "rebulk";
  version = "3.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DTC/gPygD6nGlxhaxHXarJveX2Rs4zOMn/XV3B69/rw=";
  };

  build-system = [ setuptools ];

  dependencies = [ regex ];

  pythonImportsCheck = [ "rebulk" ];

  meta = {
    description = "Advanced string matching from simple patterns";
    homepage = "https://github.com/Toilal/rebulk/";
    license = lib.licenses.mit;
  };
}
