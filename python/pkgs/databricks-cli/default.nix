{
  lib,
  buildPythonPackage,
  click,
  configparser,
  decorator,
  fetchFromGitHub,
  # build-system
  setuptools,
  mock,
  oauthlib,
  pyjwt,
  requests,
  requests-mock,
  six,
  tabulate,
}:

buildPythonPackage (finalAttrs: {
  pname = "databricks-cli";
  version = "0.18.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "databricks";
    repo = "databricks-cli";
    tag = finalAttrs.version;
    hash = "sha256-dH95C2AY/B6F9BROr6rh+gVtKqxsg1gyEU5MzCd5aqs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    configparser
    oauthlib
    pyjwt
    requests
    requests-mock
    six
    tabulate
  ];
  pythonImportsCheck = [ "databricks_cli" ];

  meta = {
    description = "Command line interface for Databricks";
    homepage = "https://github.com/databricks/databricks-cli";
    license = lib.licenses.asl20;
  };
})
