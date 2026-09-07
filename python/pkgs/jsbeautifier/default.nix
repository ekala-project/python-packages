{
  lib,
  fetchPypi,
  buildPythonPackage,
  editorconfig,
  six,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "jsbeautifier";
  version = "2.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-lXnU6duqADg/Pv3/TJjIFAu4W6MZOY6Ll82ronq9a6M=";
  };

  build-system = [ setuptools ];
  dependencies = [
    editorconfig
    six
  ];
  pythonImportsCheck = [ "jsbeautifier" ];
  meta = {
    description = "JavaScript unobfuscator and beautifier";
    mainProgram = "js-beautify";
    homepage = "http://jsbeautifier.org";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
