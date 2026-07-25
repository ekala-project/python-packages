{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage rec {
  pname = "mypy-extensions";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python";
    repo = "mypy_extensions";
    tag = version;
    hash = "sha256-HNAFsWX4tU9hfZkKxLNJn1J+H3uTesQflbRPlo3GQ4k=";
  };

  dependencies = [ flit-core ];

  pythonImportsCheck = [ "mypy_extensions" ];

  meta = {
    description = "Experimental type system extensions for programs checked with the mypy typechecker";
    homepage = "https://www.mypy-lang.org";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
