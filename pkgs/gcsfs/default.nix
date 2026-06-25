{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  aiohttp,
  decorator,
  fsspec,
  google-auth,
  google-auth-oauthlib,
  google-cloud-storage,
  requests,

}:

buildPythonPackage (finalAttrs: {
  pname = "gcsfs";
  version = "2026.3.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "fsspec";
    repo = "gcsfs";
    tag = finalAttrs.version;
    hash = "sha256-RLh3xFW/0qX5labJeUDsRRmQtnTdkvBS+gzJUJ1IP7k=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    aiohttp
    decorator
    fsspec
    google-auth
    google-auth-oauthlib
    google-cloud-storage
    requests
  ];

  # Tests require a running Docker instance
  doCheck = false;

  pythonImportsCheck = [ "gcsfs" ];

  meta = {
    description = "Convenient Filesystem interface over GCS";
    homepage = "https://github.com/fsspec/gcsfs";
    license = lib.licenses.bsd3;
  };
})
