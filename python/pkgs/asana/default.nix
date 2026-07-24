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
  version = "5.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "asana";
    repo = "python-asana";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Bfq3FKJoZE8edAAFVNYYrLJ8vp44QYboEVsCGsI5WMY=";
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
    maintainers = [ ];
  };
})
