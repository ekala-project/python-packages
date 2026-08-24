{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pegen";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "we-like-parsers";
    repo = "pegen";
    tag = "v${version}";
    hash = "sha256-P4zX8za9lBlXhNPkQe9p136ggZEJh6fHfBr+DQKvtTg=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "pegen" ];

  meta = {
    description = "Library to generate PEG parsers";
    homepage = "https://github.com/we-like-parsers/pegen";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
