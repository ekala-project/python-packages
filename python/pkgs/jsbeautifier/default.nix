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
  version = "1.15.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-W7GNnvuTMdglc1+8U2DujxqsXlJ4AEKAOUOqf4VPdZI=";
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
