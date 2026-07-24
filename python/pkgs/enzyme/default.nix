{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "enzyme";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fPd5FI2eZusoOGA+rOFAxTw878i4/l1NWgOl+11Xs8E=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "enzyme" ];

  meta = {
    description = "Python video metadata parser";
    homepage = "https://github.com/Diaoul/enzyme";
    license = lib.licenses.mit;
  };
}
