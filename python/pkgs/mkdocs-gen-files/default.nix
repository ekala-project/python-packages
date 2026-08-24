{ lib
, buildPythonPackage
, fetchFromGitHub
, hatchling
, mkdocs
,
}:

buildPythonPackage rec {
  pname = "mkdocs-gen-files";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "oprypin";
    repo = "mkdocs-gen-files";
    tag = "v${version}";
    hash = "sha256-9mOLRZZugaGCWR/Ms9z8CTvDp8QgAiGcKqiB/LGTApk=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    mkdocs
  ];

  pythonImportsCheck = [
    "mkdocs_gen_files"
  ];

  meta = {
    description = "MkDocs plugin to programmatically generate documentation pages during the build";
    homepage = "https://oprypin.github.io/mkdocs-gen-files/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
