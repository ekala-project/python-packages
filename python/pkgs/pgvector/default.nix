{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  numpy,
}:

buildPythonPackage rec {
  pname = "pgvector";
  version = "0.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pgvector";
    repo = "pgvector-python";
    tag = "v${version}";
    hash = "sha256-jzUZK3zQxqajVqGbaQzLPzvK/k3Wck9jX95kkBH2IlY=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  pythonImportsCheck = [ "pgvector" ];

  meta = {
    description = "Pgvector support for Python";
    homepage = "https://github.com/pgvector/pgvector-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
