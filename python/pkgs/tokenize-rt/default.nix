{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tokenize_rt";
  version = "6.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hDnAQrMwxVP9vhdY5KBcDtRg27uySmBvEfDe512kytY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "tokenize_rt" ];

  meta = {
    description = "Wrapper around the stdlib tokenize which roundtrips";
    homepage = "https://github.com/asottile/tokenize-rt";
    license = lib.licenses.mit;
  };
}
