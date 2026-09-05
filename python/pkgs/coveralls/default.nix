{
  buildPythonPackage,
  lib,
  fetchFromGitHub,
  # build-system
  poetry-core,
  # dependencies
  coverage,
  requests,
  typer,
}:

buildPythonPackage rec {
  pname = "coveralls";
  version = "4.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "TheKevJames";
    repo = "coveralls-python";
    tag = version;
    hash = "sha256-9gvQDGutOGf1SxfgDS0t28MjO/WPt4iv1HeqPLrfgw8=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    coverage
    requests
    typer
  ];

  meta = {
    description = "Show coverage stats online via coveralls.io";
    mainProgram = "coveralls";
    homepage = "https://github.com/coveralls-clients/coveralls-python";
    license = lib.licenses.mit;
  };
}
