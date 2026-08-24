{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python-dateutil,
  poetry-core,
  requests,
  isodate,
  ratelimit,
  typing-extensions,
  mpegdash,
  pyaes,
}:
buildPythonPackage rec {
  pname = "tidalapi";
  version = "0.8.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "EbbLabs";
    repo = "python-tidal";
    tag = "v${version}";
    hash = "sha256-5IGMSiDwEGCnMtTARmx8Z9nfc3BaCe6z32m5j2FFBAI=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    requests
    python-dateutil
    mpegdash
    isodate
    ratelimit
    typing-extensions
    pyaes
  ];

  pythonImportsCheck = [
    "tidalapi"
  ];

  meta = {
    description = "Unofficial Python API for TIDAL music streaming service";
    homepage = "https://github.com/tamland/python-tidal";
    license = lib.licenses.gpl3;
    maintainers = [ ];
  };
}
