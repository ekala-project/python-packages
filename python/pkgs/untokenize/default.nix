{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "untokenize";
  version = "0.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-OGXbu7jvtLteqnLxvn8+C+AOqLfxJcacvR9f2pJvN6I=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "untokenize" ];

  meta = {
    description = "Transforms tokens into original source code while preserving whitespace";
    homepage = "https://github.com/myint/untokenize";
    license = lib.licenses.mit;
  };
}
