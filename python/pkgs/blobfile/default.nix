{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  filelock,
  lxml,
  pycryptodomex,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "blobfile";
  version = "3.3.0";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "christopher-hesse";
    repo = "blobfile";
    tag = "v${finalAttrs.version}";
    hash = "sha256-7UatXN9K8/qpHEOKgCFyaKA+c70S4Xb/NOvqvWk2X80=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pycryptodomex
    filelock
    urllib3
    lxml
  ];

  # Tests require a running Docker instance
  doCheck = false;

  pythonImportsCheck = [ "blobfile" ];

  meta = {
    description = "Read Google Cloud Storage, Azure Blobs, and local paths with the same interface";
    homepage = "https://github.com/christopher-hesse/blobfile";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
})
