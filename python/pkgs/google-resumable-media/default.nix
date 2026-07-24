{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchPypi,
  google-auth,
  google-crc32c,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-resumable-media";
  version = "2.10.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_resumable_media";
    inherit version;
    hash = "sha256-4yS8nQ/a5MUqCK6QRW7cTnHs6Fg5nhIXrA6zpR1rxu4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    google-auth
    google-crc32c
  ];

  optional-dependencies = {
    requests = [ requests ];
    aiohttp = [ aiohttp ];
  };

  pythonImportsCheck = [
    "google._async_resumable_media"
    "google.resumable_media"
  ];

  meta = {
    description = "Utilities for Google Media Downloads and Resumable Uploads";
    homepage = "https://github.com/GoogleCloudPlatform/google-resumable-media-python";
    license = lib.licenses.asl20;
  };
}
