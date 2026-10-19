{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  wcwidth,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "blessed";
  version = "1.20.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-LN1n+HRuBI8A30eiiA9NasvNs5kDG2BONLqPcdV4doA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    wcwidth
    six
  ];

  pythonImportsCheck = [ "blessed" ];

  meta = {
    homepage = "https://github.com/jquast/blessed";
    description = "Thin, practical wrapper around terminal capabilities in Python";
    license = lib.licenses.mit;
  };
})
