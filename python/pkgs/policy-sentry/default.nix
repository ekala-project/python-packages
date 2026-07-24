{
  lib,
  beautifulsoup4,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  hatchling,
  orjson,
  pyyaml,
  requests,
  schema,
}:

buildPythonPackage rec {
  pname = "policy-sentry";
  version = "0.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "salesforce";
    repo = "policy_sentry";
    tag = version;
    hash = "sha256-oR8/hrntE4XzZHdbde+NoKWdsLs9jJ3RLIv8YsoDFt4=";
  };

  pythonRelaxDeps = [ "beautifulsoup4" ];

  build-system = [ hatchling ];

  dependencies = [
    beautifulsoup4
    click
    orjson
    pyyaml
    requests
    schema
  ];
  pythonImportsCheck = [ "policy_sentry" ];

  meta = {
    description = "Python module for generating IAM least privilege policies";
    homepage = "https://github.com/salesforce/policy_sentry";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    mainProgram = "policy_sentry";
  };
}
