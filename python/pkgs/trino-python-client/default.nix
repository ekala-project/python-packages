{
  lib,
  boto3,
  buildPythonPackage,
  fetchFromGitHub,
  httpretty,
  keyring,
  lz4,
  orjson,
  python-dateutil,
  pytz,
  requests-gssapi,
  requests-kerberos,
  requests,
  setuptools,
  sqlalchemy,
  testcontainers,
  tzlocal,
  zstandard,
}:

buildPythonPackage rec {
  pname = "trino-python-client";
  version = "0.338.0";
  pyproject = true;

  src = fetchFromGitHub {
    repo = "trino-python-client";
    owner = "trinodb";
    tag = version;
    hash = "sha256-kWbqzdeOkzjhcaQOS4bCUnXFILpurtVE3N3KLoqSeds=";
  };

  build-system = [ setuptools ];

  dependencies = [
    lz4
    orjson
    python-dateutil
    pytz
    requests
    tzlocal
    zstandard
  ];

  optional-dependencies = lib.fix (self: {
    kerberos = [ requests-kerberos ];
    gsaapi = [ requests-gssapi ];
    sqlalchemy = [ sqlalchemy ];
    external-authentication-token-cache = [ keyring ];
    all = self.kerberos ++ self.sqlalchemy;
  });
  disabledTestMarks = [ "auth" ];
  meta = {
    description = "Client for the Trino distributed SQL Engine";
    homepage = "https://github.com/trinodb/trino-python-client";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
