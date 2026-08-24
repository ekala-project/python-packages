{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "anyqt";
  version = "0.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ales-erjavec";
    repo = "anyqt";
    tag = finalAttrs.version;
    hash = "sha256-iDUgu+x9rnpxpHzO7Rf2rJFXsheivrK7HI3FUbomkTU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "AnyQt" ];

  meta = {
    description = "PyQt/PySide compatibility layer";
    homepage = "https://github.com/ales-erjavec/anyqt";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
  };
})
