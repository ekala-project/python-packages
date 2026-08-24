{ lib
, fetchFromGitLab
, buildPythonPackage
, setuptools
,
}:

buildPythonPackage rec {
  pname = "python-sql";
  version = "1.7.0";
  pyproject = true;

  src = fetchFromGitLab {
    domain = "foss.heptapod.net";
    owner = "tryton";
    repo = "python-sql";
    tag = version;
    hash = "sha256-JhMJEng6QftWBmJIC2pYlf9fkHHmSd3k0tSwr35MmVQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "sql" ];

  meta = {
    description = "Library to write SQL queries in a pythonic way";
    homepage = "https://foss.heptapod.net/tryton/python-sql";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
