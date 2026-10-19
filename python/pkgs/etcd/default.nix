{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  simplejson,
  pytz,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "etcd";
  version = "2.0.8";
  pyproject = true;

  # PyPI package is incomplete
  src = fetchFromGitHub {
    owner = "dsoprea";
    repo = "PythonEtcdClient";
    tag = finalAttrs.version;
    hash = "sha256-h+jYIRSNdrGkW3tBV1ifIDEXU46EQGyeJoz/Mxym4pI=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    sed -i -e '13,14d;37d' setup.py
  '';

  dependencies = [
    simplejson
    pytz
    requests
  ];

  # No proper tests are available

  meta = {
    description = "Python etcd client that just works";
    homepage = "https://github.com/dsoprea/PythonEtcdClient";
    license = lib.licenses.gpl2;
  };
})
