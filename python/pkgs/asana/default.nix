{
  lib,
  buildPythonPackage,
  certifi,
  fetchFromGitHub,
  python-dateutil,
  python-dotenv,
  setuptools,
  six,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "asana";
  version = "5.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "asana";
    repo = "python-asana";
    tag = "v${finalAttrs.version}";
    hash = "sha256-cKRDcpTfbIB7dnm+EhSHA1G0vCQmnCTeFVSvt0unKbM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    certifi
    six
    python-dateutil
    python-dotenv
    urllib3
  ];
  pythonImportsCheck = [ "asana" ];
  meta = {
    description = "Python client library for Asana";
    homepage = "https://github.com/asana/python-asana";
    license = lib.licenses.mit;
  };
})
