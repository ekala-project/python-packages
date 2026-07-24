{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pydispatcher";
  version = "2.0.7";
  pyproject = true;

  src = fetchPypi {
    pname = "PyDispatcher";
    inherit version;
    hash = "sha256-t3fGrQgNwbrXSkwp1qRpFPpnAaxw+UsNZvvP3mL1vjE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pydispatch" ];

  meta = {
    homepage = "https://pydispatcher.sourceforge.net/";
    description = "Multi-producer multi-consumer signal dispatching mechanism";
    license = lib.licenses.bsd3;
  };
}
