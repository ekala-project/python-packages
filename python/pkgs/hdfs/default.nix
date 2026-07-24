{
  buildPythonPackage,
  docopt,
  fastavro,
  fetchFromGitHub,
  lib,
  requests,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "hdfs";
  version = "2.7.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mtth";
    repo = "hdfs";
    tag = "v${version}";
    hash = "sha256-Pm2E8hB0wbu7npi/sLt9D8jQsH69qNOHLji9CYqST/8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    docopt
    requests
    six
  ];
  pythonImportsCheck = [ "hdfs" ];

  meta = {
    description = "Python API and command line interface for HDFS";
    homepage = "https://github.com/mtth/hdfs";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "hdfscli";
  };
}
