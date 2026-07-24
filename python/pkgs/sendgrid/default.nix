{
  lib,
  buildPythonPackage,
  cryptography,
  ecdsa,
  fetchFromGitHub,
  flask,
  python-http-client,
  pyyaml,
  setuptools,
  starkbank-ecdsa,
  werkzeug,
}:

buildPythonPackage rec {
  pname = "sendgrid";
  version = "6.12.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = pname;
    repo = "sendgrid-python";
    tag = version;
    hash = "sha256-7r1FHcGmHRQK9mfpV3qcuZlIe7G6CIyarnpWLjduw4E=";
  };

  pythonRelaxDeps = [ "cryptography" ];

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    ecdsa
    python-http-client
    starkbank-ecdsa
  ];
  pythonImportsCheck = [ "sendgrid" ];

  meta = {
    description = "Python client for SendGrid";
    homepage = "https://github.com/sendgrid/sendgrid-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
