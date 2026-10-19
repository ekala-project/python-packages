{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "typing-extensions";
  version = "4.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python";
    repo = "typing_extensions";
    tag = finalAttrs.version;
    hash = "sha256-L1BRIDYz0YqYE4geKTxIkbCbzTGz7AtrbpB5vR8T4dw=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "typing_extensions" ];
  meta = {
    description = "Backported and Experimental Type Hints for Python";
    homepage = "https://github.com/python/typing";
    license = lib.licenses.psfl;
  };
})
