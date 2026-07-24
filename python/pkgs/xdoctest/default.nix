{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "xdoctest";
  version = "1.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Erotemic";
    repo = "xdoctest";
    tag = "v${version}";
    hash = "sha256-cwRelkADUrSbrzJ8JjgLCiPil2ynwFmaLLWByJWkXwA=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];
  pythonImportsCheck = [ "xdoctest" ];

  meta = {
    description = "Rewrite of Python's builtin doctest module (with pytest plugin integration) with AST instead of REGEX";
    homepage = "https://github.com/Erotemic/xdoctest";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "xdoctest";
  };
}
