{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "esprima";
  version = "4.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Kronuz";
    repo = "esprima-python";
    tag = "v${finalAttrs.version}";
    sha256 = "WtkPCReXhxyr6pOzE9gsdIeBlLk+nSnbxkS3OowEaHo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "esprima" ];

  meta = {
    description = "Python parser for standard-compliant ECMAScript";
    mainProgram = "esprima";
    homepage = "https://github.com/Kronuz/esprima-python";
    license = lib.licenses.bsd2;
  };
})
