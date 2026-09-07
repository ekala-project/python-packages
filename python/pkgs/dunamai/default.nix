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
  version = "1.26.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mtkennerly";
    repo = "dunamai";
    tag = "v${version}";
    hash = "sha256-pP0KeQ1tThvBomQIlrWNCVzB8ghR9rfaLm5NeBKwiuE=";
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
