{
  lib,
  buildPythonPackage,
  cffi,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-crc32c";
  version = "1.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "python-crc32c";
    tag = "v${version}";
    hash = "sha256-bNTWyOWie1tPiptJ6NPCyC5kzcCpgOZ0w5hKVw07iwc=";
  };

  build-system = [ setuptools ];

  dependencies = [ cffi ];

  pythonImportsCheck = [ "google_crc32c" ];

  meta = {
    description = "Wrapper the google/crc32c hardware-based implementation of the CRC32C hashing algorithm";
    homepage = "https://github.com/googleapis/python-crc32c";
    license = with lib.licenses; [ asl20 ];
  };
}
