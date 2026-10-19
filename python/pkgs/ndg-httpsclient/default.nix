{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pyasn1,
  pyopenssl,
}:

buildPythonPackage rec {
  version = "0.5.1";
  pyproject = true;
  pname = "ndg-httpsclient";

  src = fetchFromGitHub {
    owner = "cedadev";
    repo = "ndg_httpsclient";
    tag = version;
    sha256 = "0lhsgs4am4xyjssng5p0vkfwqncczj1dpa0vss4lrhzq86mnn5rz";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyasn1
    pyopenssl
  ];

  # uses networking

  meta = {
    homepage = "https://github.com/cedadev/ndg_httpsclient/";
    description = "Provide enhanced HTTPS support for httplib and urllib2 using PyOpenSSL";
    mainProgram = "ndg_httpclient";
    license = lib.licenses.bsd2;
  };
}
