{ buildPythonPackage
, lib
, fetchFromGitHub
, # build-system
  poetry-core
, # checks
  coverage
, docopt
, requests
,
}:

buildPythonPackage rec {
  pname = "coveralls";
  version = "4.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "TheKevJames";
    repo = "coveralls-python";
    tag = version;
    hash = "sha256-c7YV1SAbxmqfVI/wGtfdr+S4T7G2q7tf0FhuyCJaPDg=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    coverage
    docopt
    requests
  ];


  meta = {
    description = "Show coverage stats online via coveralls.io";
    mainProgram = "coveralls";
    homepage = "https://github.com/coveralls-clients/coveralls-python";
    license = lib.licenses.mit;
  };
}

