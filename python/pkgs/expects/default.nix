{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "expects";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jaimegildesagredo";
    repo = "expects";
    rev = "v${version}";
    hash = "sha256-3j9LMt/IakIyFz4I+OoGwZnEg/0KzjyBQJ4miyCsYVY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "expects" ];

  meta = {
    description = "Expressive and extensible TDD/BDD assertion library for Python";
    homepage = "https://expects.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
