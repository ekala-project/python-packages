{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  six,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "imapclient";
  version = "3.1.0";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "mjs";
    repo = "imapclient";
    tag = finalAttrs.version;
    hash = "sha256-J+pB+jXAoZItvaR8o+97sETFYxWj+uslmvsAe/Q0Gzc=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [
    "imapclient"
    "imapclient.response_types"
    "imapclient.exceptions"
    "imapclient.testable_imapclient"
    "imapclient.tls"
  ];

  meta = {
    homepage = "https://imapclient.readthedocs.io";
    description = "Easy-to-use, Pythonic and complete IMAP client library";
    license = lib.licenses.bsd3;
  };
})
