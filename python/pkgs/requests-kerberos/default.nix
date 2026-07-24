{
  lib,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  pyspnego,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "requests-kerberos";
  version = "0.15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "requests";
    repo = "requests-kerberos";
    tag = "v${version}";
    hash = "sha256-s1Q3zqKPSuTkiFExr+axai9Eta1xjw/cip8xzfDGR88=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    requests
    pyspnego
  ];

  pythonImportsCheck = [ "requests_kerberos" ];

  meta = {
    description = "Authentication handler for using Kerberos with Python Requests";
    homepage = "https://github.com/requests/requests-kerberos";
    license = lib.licenses.isc;
  };
}
