{
  lib,
  brotli,
  buildPythonPackage,
  certifi,
  dpkt,
  fetchFromGitHub,
  gevent,
  setuptools,
  stdenv,
  urllib3,
}:

buildPythonPackage rec {
  pname = "geventhttpclient";
  version = "2.3.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "geventhttpclient";
    repo = "geventhttpclient";
    tag = version;
    # TODO: unvendor llhttp
    fetchSubmodules = true;
    hash = "sha256-SBrF/e36wO9W+tNzbe6nGQrRgl1w0X4X1lmkrJM1OLY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    brotli
    certifi
    gevent
    urllib3
  ];
  # lots of: [Errno 48] Address already in use: ('127.0.0.1', 54323)
  doCheck = !stdenv.hostPlatform.isDarwin;
  disabledTestMarks = [ "network" ];

  pythonImportsCheck = [ "geventhttpclient" ];

  meta = {
    homepage = "https://github.com/geventhttpclient/geventhttpclient";
    description = "High performance, concurrent HTTP client library using gevent";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
