{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  mock,
}:

buildPythonPackage rec {
  pname = "python-http-client";
  version = "3.3.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sendgrid";
    repo = "python-http-client";
    tag = version;
    hash = "sha256-8Qs5Jw0LMV2UucLnlFKJQ2PUhYaQx6uJdIV/4gaPH3w=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "python_http_client" ];

  meta = {
    description = "Python HTTP library to call APIs";
    homepage = "https://github.com/sendgrid/python-http-client";
    license = lib.licenses.mit;
  };
}
