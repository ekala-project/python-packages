{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  beautifulsoup4,
  boto3,
  botocore,
  lxml,
  packaging,
  pytz,
  requests,
  scramp,

  # test
  pytest-mock,
}:

buildPythonPackage rec {
  pname = "redshift-connector";
  version = "2.1.13";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "amazon-redshift-python-driver";
    tag = "v${version}";
    hash = "sha256-sjHLw3qpEWaqaGrsaS903NbuAPscnr+GlV4znQD+Hu4=";
  };

  # remove addops as they add test directory and coverage parameters to pytest
  postPatch = ''
    substituteInPlace setup.cfg --replace 'addopts =' 'no-opts ='
  '';

  build-system = [ setuptools ];

  dependencies = [
    beautifulsoup4
    boto3
    botocore
    lxml
    packaging
    pytz
    requests
    scramp
  ];

  pythonRelaxDeps = [ "lxml" ];
  # integration tests require a Redshift cluster
  # required for tests

  meta = {
    description = "Redshift interface library";
    homepage = "https://github.com/aws/amazon-redshift-python-driver";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
