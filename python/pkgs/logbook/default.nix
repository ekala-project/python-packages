{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "logbook";
  version = "1.10.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-f9+NCdYMnqpNjSezc2O0zid9AZ9MrlwlnqAwQPe2NLc=";
  };

  env.DISABLE_LOGBOOK_CEXT = "1";

  postPatch = ''
    sed -i 's/requires = .*/requires = ["setuptools"]/' pyproject.toml
  '';

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "logbook" ];

  meta = {
    homepage = "https://logbook.readthedocs.io/";
    description = "Logging replacement for Python";
    license = lib.licenses.bsd3;
  };
}
