{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build dependencies
  poetry-core,
  # dependencies
  babelfish,
  pyyaml,
  rebulk,
}:

buildPythonPackage rec {
  pname = "trakit";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ratoaq2";
    repo = "trakit";
    tag = version;
    hash = "sha256-uKLuXkvyZWjCMx5MHlsTKvTJwHYYV+wnRyE+D8BtCC0=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    babelfish
    pyyaml
    rebulk
  ];

  pythonImportsCheck = [ "trakit" ];

  meta = {
    description = "Guess additional information from track titles";
    homepage = "https://github.com/ratoaq2/trakit";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
