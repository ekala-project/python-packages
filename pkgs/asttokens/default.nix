{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "asttokens";
  version = "3.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gristlabs";
    repo = "asttokens";
    tag = "v${version}";
    hash = "sha256-1qkkNpjX89TmGD0z0KA2y+UbiHuEOaXzZ6hs9nw7EeM=";
  };

  build-system = [ setuptools-scm ];

  pythonImportsCheck = [ "asttokens" ];

  meta = {
    description = "Annotate Python AST trees with source text and token information";
    homepage = "https://github.com/gristlabs/asttokens";
    license = lib.licenses.asl20;
  };
}
