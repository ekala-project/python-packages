{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  tokenize-rt,
}:

buildPythonPackage rec {
  pname = "unasync";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-trio";
    repo = "unasync";
    rev = "v${version}";
    sha256 = "sha256-ZRvmX1fSfSJ1HNEymzhIuUi3tdjFmUoidfr0rN8c7tk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    setuptools
    tokenize-rt
  ];
  pythonImportsCheck = [ "unasync" ];

  meta = {
    description = "Project that can transform your asynchronous code into synchronous code";
    homepage = "https://github.com/python-trio/unasync";
    license = with lib.licenses; [
      mit # or
      asl20
    ];
    maintainers = [ ];
  };
}
