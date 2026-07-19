{
  lib,
  buildPythonPackage,
  fetchPypi,
  requests,
  requests-oauthlib,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ovh";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-0xHwjsF7YsxhIWs9rPA+6J+VodqQNqWV2sKfydeYuCc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    requests-oauthlib
  ];

  pythonImportsCheck = [ "ovh" ];

  meta = {
    description = "Thin wrapper around OVH's APIs";
    homepage = "https://github.com/ovh/python-ovh";
    license = lib.licenses.bsd2;
  };
}
