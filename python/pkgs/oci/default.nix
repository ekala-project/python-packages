{
  lib,
  aiohttp,
  buildPythonPackage,
  certifi,
  circuitbreaker,
  crc32c,
  cryptography,
  fetchFromGitHub,
  pyjwt,
  pyopenssl,
  python-dateutil,
  pytz,
  setuptools,
  urllib3,
}:

buildPythonPackage rec {
  pname = "oci";
  version = "2.185.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "oracle";
    repo = "oci-python-sdk";
    tag = "v${version}";
    hash = "sha256-nmfTEbY9tVxhkFk6gEaJ7ntetpe2XVhflrY8YmJuL2Y=";
  };

  pythonRelaxDeps = [
    "cryptography"
    "pyOpenSSL"
  ];

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    certifi
    circuitbreaker
    crc32c
    cryptography
    pyjwt
    pyopenssl
    python-dateutil
    pytz
    urllib3
  ];

  # Tests fail: https://github.com/oracle/oci-python-sdk/issues/164
  doCheck = false;

  pythonImportsCheck = [ "oci" ];

  meta = {
    description = "Oracle Cloud Infrastructure Python SDK";
    homepage = "https://github.com/oracle/oci-python-sdk";
    license = with lib.licenses; [
      asl20 # or
      upl
    ];
  };
}
