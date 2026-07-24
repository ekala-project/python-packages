{
  lib,
  stdenv,
  buildPythonPackage,
  isPyPy,
  fetchFromGitHub,
  fetchpatch2,
  curl,
  openssl,
  bottle,
  flaky,
  flask,
  numpy,
  websockets,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pycurl";
  version = "7.46.0";
  pyproject = true;

  disabled = isPyPy; # https://github.com/pycurl/pycurl/issues/208

  src = fetchFromGitHub {
    owner = "pycurl";
    repo = "pycurl";
    tag = "REL_${lib.replaceStrings [ "." ] [ "_" ] version}";
    hash = "sha256-F40bJ7TYFK2dVkDJGGxl7XV46fKmjwvUYYulcwGL6hk=";
  };

  patches = [
    (fetchpatch2 {
      name = "pycurl-curl-8.21.0-ws-support.patch";
      url = "https://github.com/pycurl/pycurl/commit/c78fd8aba82e2f8037275063138eaa7706c111af.diff?full_index=1";
      hash = "sha256-EBXgGiaMtXTsgJOOrzzZFJ7Q/ofAlc4zuipoEpfdFqU=";
    })
  ];

  preConfigure = ''
    substituteInPlace setup.py \
      --replace-fail '--static-libs' '--libs'
    export PYCURL_SSL_LIBRARY=openssl
  '';

  build-system = [ setuptools ];

  nativeBuildInputs = [ curl ];

  buildInputs = [
    curl
    openssl
  ];

  pythonImportsCheck = [ "pycurl" ];
  meta = {
    description = "Python Interface To The cURL library";
    homepage = "http://pycurl.io/";
    license = with lib.licenses; [
      lgpl2Only
      mit
    ];
    maintainers = [ ];
  };
}
