{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  setuptools,
  cachecontrol,
  cryptography,
  google-api-python-client,
  google-cloud-firestore,
  google-cloud-storage,
  h2,
  httpx,
  pyjwt,
  requests,
  respx,
  pytest-asyncio,
  pytest-localserver,
  pytest-mock,
}:

buildPythonPackage (finalAttrs: {
  pname = "firebase-admin";
  version = "7.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "firebase";
    repo = "firebase-admin-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-jjCUk20RWB2Qc2qBh4CIGtUGsdCSqsbtmKKamSLCwQw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cachecontrol
    cryptography
    google-api-python-client
    google-cloud-firestore
    google-cloud-storage
    httpx
    pyjwt
    requests
  ];
  meta = {
    description = "Firebase Admin Python SDK";
    homepage = "https://github.com/firebase/firebase-admin-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
