{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  mock,
}:

buildPythonPackage rec {
  pname = "python-http-client";
  version = "3.3.7";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "sendgrid";
    repo = "python-http-client";
    rev = version;
    hash = "sha256-8Qs5Jw0LMV2UucLnlFKJQ2PUhYaQx6uJdIV/4gaPH3w=";
  };
  pythonImportsCheck = [ "python_http_client" ];

  meta = {
    description = "Python HTTP library to call APIs";
    homepage = "https://github.com/sendgrid/python-http-client";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
