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
  version = "0.2.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ratoaq2";
    repo = "trakit";
    tag = version;
    hash = "sha256-x/83yRzvQ81+wS0lJr52KYBMoPvSVDr17ppxG/lSfUg=";
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
