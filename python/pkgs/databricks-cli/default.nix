{
  lib,
  buildPythonPackage,
  click,
  configparser,
  decorator,
  fetchFromGitHub,
  mock,
  oauthlib,
  pyjwt,
  requests,
  requests-mock,
  six,
  tabulate,
}:

buildPythonPackage rec {
  pname = "databricks-cli";
  version = "0.18.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "databricks";
    repo = "databricks-cli";
    tag = version;
    hash = "sha256-dH95C2AY/B6F9BROr6rh+gVtKqxsg1gyEU5MzCd5aqs=";
  };

  propagatedBuildInputs = [
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
    maintainers = [ ];
  };
}
