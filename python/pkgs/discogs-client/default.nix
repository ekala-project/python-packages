{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  requests,
  oauthlib,
  python-dateutil,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "discogs-client";
  version = "2.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "joalla";
    repo = "discogs_client";
    tag = "v${version}";
    hash = "sha256-UWiop9hg6KSpSq4SnTtvFbRHYTnLe/Ed/o65sf78MYo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    oauthlib
    python-dateutil
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "discogs_client" ];

  meta = {
    description = "Unofficial Python API client for Discogs";
    homepage = "https://github.com/joalla/discogs_client";
    license = lib.licenses.bsd2;
  };
}
