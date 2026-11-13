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

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-dns";
  version = "0.37.2";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_dns";
    inherit (finalAttrs) version;
    hash = "sha256-KVYp3g7p9VaeoyHfF6CYb0TZZ19zbWVJOgeBIc2+Mho=";
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
})
