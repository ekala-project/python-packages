{
  lib,
  boto3,
  botocore,
  buildPythonPackage,
  cached-property,
  click,
  click-option-group,
  fetchFromGitHub,
  jinja2,
  markdown,
  policy-sentry,
  pyyaml,
  schema,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cloudsplaining";
  version = "0.8.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "salesforce";
    repo = "cloudsplaining";
    tag = version;
    hash = "sha256-Abp/uvH1IYO/rb2o+7uI0Ef6q7K6T0kN1mo+Qit438E=";
  };

  pythonRelaxDeps = true;

  build-system = [ setuptools ];

  dependencies = [
    boto3
    botocore
    cached-property
    click
    click-option-group
    jinja2
    markdown
    policy-sentry
    pyyaml
    schema
  ];
  pythonImportsCheck = [ "cloudsplaining" ];

  meta = {
    description = "Python module for AWS IAM security assessment";
    homepage = "https://github.com/salesforce/cloudsplaining";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    mainProgram = "cloudsplaining";
  };
}
