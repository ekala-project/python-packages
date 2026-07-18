{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "confusable_homoglyphs";
  version = "3.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uZUAHJsuG0zqDPXzhAp8eRiKjLutBT1pNXK9jBwexGA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "confusable_homoglyphs" ];

  meta = {
    description = "Detect confusable usage of unicode homoglyphs";
    homepage = "https://sr.ht/~valhalla/confusable_homoglyphs/";
    license = lib.licenses.mit;
  };
}
