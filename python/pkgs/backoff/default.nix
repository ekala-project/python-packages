{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "backoff";
  version = "2.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "litl";
    repo = "backoff";
    tag = "v${version}";
    hash = "sha256-g8bYGJ6Kw6y3BUnuoP1IAye5CL0geH5l7pTb3xxq7jI=";
  };

  nativeBuildInputs = [ poetry-core ];

  pythonImportsCheck = [ "backoff" ];

  meta = {
    description = "Function decoration for backoff and retry";
    homepage = "https://github.com/litl/backoff";
    license = lib.licenses.mit;
  };
}
