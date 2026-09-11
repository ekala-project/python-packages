{
  lib,
  fetchPypi,
  buildPythonPackage,

  # build-system
  flit-core,

  wcwidth,
  six,
}:

buildPythonPackage rec {
  pname = "blessed";
  version = "1.20.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LN1n+HRuBI8A30eiiA9NasvNs5kDG2BONLqPcdV4doA=";
  };

  build-system = [ flit-core ];

  dependencies = [
    wcwidth
    six
  ];

  pythonImportsCheck = [ "blessed" ];

  meta = {
    homepage = "https://github.com/jquast/blessed";
    description = "Thin, practical wrapper around terminal capabilities in Python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
