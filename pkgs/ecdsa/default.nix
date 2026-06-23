{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "ecdsa";
  version = "0.19.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tlsfuzzer";
    repo = "python-ecdsa";
    tag = "python-ecdsa-${finalAttrs.version}";
    hash = "sha256-u+EwAF/EnF33l/gy5y8eoA7aVeI/0cq9DDL9UUwgPFw=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "ecdsa" ];

  meta = {
    description = "ECDSA cryptographic signature library";
    homepage = "https://github.com/warner/python-ecdsa";
    license = lib.licenses.mit;
    knownVulnerabilities = [
      "CVE-2024-23342"
    ];
  };
})
