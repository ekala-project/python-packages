{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-cloud-core,
  mock,
  pytestCheckHook,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-dns";
  version = "0.37.1";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_dns";
    inherit version;
    hash = "sha256-hOh+a74RhF41dkhPVb5apEq8vS5nfNV9P4Qed6uSdwI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    google-api-core
    google-cloud-core
  ];

  nativeCheckInputs = [
    mock
    pytestCheckHook
  ];

  preCheck = ''
    # don#t shadow python imports
    rm -r google
  '';

  disabledTests = [
    # Test requires credentials
    "test_quota"
  ];

  pythonImportsCheck = [ "google.cloud.dns" ];

  meta = {
    description = "Google Cloud DNS API client library";
    homepage = "https://cloud.google.com/dns";
    license = lib.licenses.asl20;
  };
}
