{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pycrypto,
  requests,
}:

buildPythonPackage rec {
  pname = "apache-libcloud";
  version = "3.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-db9MCxI7wiXiTKlfyhw1vjCxnmu4X+6ngUBNQ8QnbJE=";
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
    substituteInPlace setup.py \
      --replace "setup_requires=pytest_runner," "setup_requires=[],"
  '';

  # requires a certificates file

  pythonImportsCheck = [ "libcloud" ];

  meta = {
    description = "Unified interface to many cloud providers";
    homepage = "https://libcloud.apache.org/";
    license = lib.licenses.asl20;
  };
}
