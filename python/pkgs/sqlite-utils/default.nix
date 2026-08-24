{ lib
, buildPythonPackage
, fetchFromGitHub
, click
, click-default-group
, python-dateutil
, sqlite-fts4
, tabulate
, pip
, pluggy
, testers
, sqlite-utils
, setuptools
,
}:
buildPythonPackage (finalAttrs: {
  pname = "sqlite-utils";
  version = "4.1.1";
  pyproject = true;
  __structuredAttrs = true;

  build-system = [ setuptools ];

  src = fetchFromGitHub {
    owner = "simonw";
    repo = "sqlite-utils";
    tag = finalAttrs.version;
    hash = "sha256-igf4d+5iyC+gYb9TL2JCNzTmTrCgRdR9gscTcfslDng=";
  };

  dependencies = [
    click
    click-default-group
    pip
    pluggy
    python-dateutil
    sqlite-fts4
    tabulate
  ];

  pythonImportsCheck = [ "sqlite_utils" ];

  passthru.tests.version = testers.testVersion { package = sqlite-utils; };

  meta = {
    description = "Python CLI utility and library for manipulating SQLite databases";
    mainProgram = "sqlite-utils";
    homepage = "https://github.com/simonw/sqlite-utils";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
