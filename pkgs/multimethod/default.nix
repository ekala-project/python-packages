{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "multimethod";
  version = "2.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "coady";
    repo = "multimethod";
    tag = "v${version}";
    hash = "sha256-0En3NdLLmS/4bw0I3z9xxKa85tECi1rjmpZyxYuZk3w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "multimethod" ];

  meta = {
    description = "Multiple argument dispatching";
    homepage = "https://coady.github.io/multimethod/";
    changelog = "https://github.com/coady/multimethod/blob/${src.tag}/CHANGELOG.md";
    license = lib.licenses.asl20;
  };
}
