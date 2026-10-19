{
  lib,
  pkgs,
  buildPythonPackage,
  requests,
  six,
  # build-system
  setuptools,
}:

buildPythonPackage {
  pname = "dopy";
  version = "2016-01-04";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "Wiredcraft";
    repo = "dopy";
    rev = "cb443214166a4e91b17c925f40009ac883336dc3";
    sha256 = "0ams289qcgna96aak96jbz6wybs6qb95h2gn8lb4lmx2p5sq4q56";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    six
  ];

  # contains no tests
  pythonImportsCheck = [ "dopy" ];

  meta = {
    description = "Digital Ocean API python wrapper";
    homepage = "https://github.com/Wiredcraft/dopy";
    license = lib.licenses.mit;
  };
}
