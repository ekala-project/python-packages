{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage rec {
  pname = "entrypoints";
  version = "0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-twbt2qkhihnrzWe1aBjwW7J1ibHKno15e3Sv+tTMrNQ=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "entrypoints" ];

  meta = {
    homepage = "https://github.com/takluyver/entrypoints";
    description = "Discover and load entry points from installed packages";
    license = lib.licenses.mit;
  };
}
