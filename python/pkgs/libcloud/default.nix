{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pycrypto,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "apache-libcloud";
  version = "3.9.1";
  pyproject = true;

  src = fetchPypi {
    pname = "apache_libcloud";
    inherit (finalAttrs) version;
    hash = "sha256-tl6qWsMrKKD5VV5qIj26Oec7mbaCzYSWJFh857wlFmE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pycrypto
    requests
  ];

  preConfigure = ''
    cp libcloud/test/secrets.py-dist libcloud/test/secrets.py
  '';

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools>=75.3,<80.11"' '"setuptools"' \
      --replace-fail '"wheel~=0.45.1"' '"wheel"'
  '';

  # requires a certificates file

  pythonImportsCheck = [ "libcloud" ];

  meta = {
    description = "Unified interface to many cloud providers";
    homepage = "https://libcloud.apache.org/";
    license = lib.licenses.asl20;
  };
})
