{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  aiohttp,
  azure-identity,
  azure-storage-blob,
  azure-storage-file-share,
  boto3,
  dulwich,
  google-cloud-storage,
  huggingface-hub,
  oras,
  requests,

  # tests
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "kserve-storage";
  version = "0.21.0";
  pyproject = true;

  src = fetchPypi {
    pname = "kserve_storage";
    inherit (finalAttrs) version;
    hash = "sha256-6pZppck0MpJc9x8ZduTCIio6dvMB3tDPJmQKmfdI3so=";
  };

  build-system = [
    setuptools
  ];

  pythonRelaxDeps = [
    "google-cloud-storage"
  ];
  pythonRemoveDeps = [
    # not packaged; import is guarded and only needed for modelscope:// URIs
    "modelscope-hub"
  ];
  dependencies = [
    aiohttp
    azure-identity
    azure-storage-blob
    azure-storage-file-share
    boto3
    dulwich
    google-cloud-storage
    huggingface-hub
    oras
    requests
  ];

  pythonImportsCheck = [ "kserve_storage" ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  disabledTests = [
    # RuntimeError: Failed to fetch model. No model found in file:///tmp.
    "test_local_path_with_out_dir_exist"
  ];

  meta = {
    description = "KServe Storage Handler. This module is responsible to download the models from the provided source";
    homepage = "https://pypi.org/project/kserve-storage";
    license = lib.licenses.asl20;
  };
})
