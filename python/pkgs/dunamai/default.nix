{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # dependencies
  packaging,
}:

buildPythonPackage rec {
  pname = "dunamai";
  version = "1.25.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mtkennerly";
    repo = "dunamai";
    tag = "v${version}";
    hash = "sha256-kPOEhJwsSzGea7fS5y5tbAvzZZ+OxIyjpYpS6i++rHE=";
  };

  build-system = [ poetry-core ];

  dependencies = [ packaging ];
  pythonImportsCheck = [ "dunamai" ];

  meta = {
    description = "Dynamic version generation";
    mainProgram = "dunamai";
    homepage = "https://github.com/mtkennerly/dunamai";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
