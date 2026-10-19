{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pyopenssl,
  requests,
}:

buildPythonPackage rec {
  pname = "requests-pkcs12";
  version = "1.27";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "m-click";
    repo = "requests_pkcs12";
    tag = version;
    hash = "sha256-4B7jL3OubIF8ZOYzsODltZCAHhb+PM18uJDOssuM6R4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    pyopenssl
  ];

  # Project has no tests

  pythonImportsCheck = [ "requests_pkcs12" ];

  meta = {
    description = "PKCS#12 support for the Python requests library";
    homepage = "https://github.com/m-click/requests_pkcs12";
    license = lib.licenses.isc;
  };
}
