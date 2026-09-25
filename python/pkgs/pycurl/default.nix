{
  lib,
  stdenv,
  buildPythonPackage,
  isPyPy,
  fetchFromGitHub,
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
  version = "7.47.0";
  pyproject = true;

  disabled = isPyPy; # https://github.com/pycurl/pycurl/issues/208

  src = fetchFromGitHub {
    owner = "pycurl";
    repo = "pycurl";
    tag = "REL_${lib.replaceStrings [ "." ] [ "_" ] version}";
    hash = "sha256-5mZvNVJS1WwBj4joNflSicllgTPL2SwstwO/n2vylJ0=";
  };

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
  };
}
