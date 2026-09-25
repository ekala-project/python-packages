{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  babel,
  gitpython,
  mkdocs,
  pytz,
}:

buildPythonPackage rec {
  pname = "mkdocs-git-revision-date-localized-plugin";
  version = "1.5.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "timvink";
    repo = "mkdocs-git-revision-date-localized-plugin";
    tag = "v${version}";
    hash = "sha256-0WLSQ2EmW4GUMtjdrUqZdcMt+695eSqxeVwBPCHXXhM=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    babel
    gitpython
    mkdocs
    pytz
  ];
  pythonImportsCheck = [ "mkdocs_git_revision_date_localized_plugin" ];

  meta = {
    description = "MkDocs plugin that enables displaying the date of the last git modification of a page";
    homepage = "https://github.com/timvink/mkdocs-git-revision-date-localized-plugin";
    license = lib.licenses.mit;
  };
}
