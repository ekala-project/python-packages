{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "eval-type-backport";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alexmojaki";
    repo = "eval_type_backport";
    tag = "v${version}";
    hash = "sha256-ipo0atAAz0LhUwsO5Hm8fAG6lfjoKXZjF0bH7p2u63k=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "eval_type_backport" ];

  meta = {
    description = "Like `typing._eval_type`, but lets older Python versions use newer typing features";
    homepage = "https://github.com/alexmojaki/eval_type_backport";
    license = lib.licenses.mit;
  };
}
