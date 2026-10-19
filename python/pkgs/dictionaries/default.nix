{
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  lib,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "dictionaries";
  version = "0.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "8fa92745eb7c707b8588888875234f2f0a61b67936d8deb91b2b7b4c32366112";
  };

  build-system = [ setuptools ];

  buildInputs = [ six ];

  meta = {
    description = "Dict implementations with attribute access";
    license = lib.licenses.mit;
  };
})
