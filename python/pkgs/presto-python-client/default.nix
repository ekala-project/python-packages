{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  click,
  httpretty,
  requests,
  requests-kerberos,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "presto-python-client";
  version = "0.8.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "prestodb";
    repo = "presto-python-client";
    tag = version;
    hash = "sha256-ZpVcmX6jRu4PJ1RxtIR8i0EpfhhhP8HZVVkB7CWLrsM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    requests
    requests-kerberos
    six
  ];
  # Integration tests require network access
  pythonImportsCheck = [ "prestodb" ];

  meta = {
    description = "Client for Presto (https://prestodb.io), a distributed SQL engine for interactive and batch big data processing";
    homepage = "https://github.com/prestodb/presto-python-client";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
