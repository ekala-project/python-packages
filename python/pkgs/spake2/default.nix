{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  cryptography,
}:

buildPythonPackage rec {
  pname = "spake2";
  version = "0.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Qh/EqNWsOVr3rwIG/9nmzfGIwQXLG4g9nWgzErtakzQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ cryptography ];

  pythonImportsCheck = [ "spake2" ];

  meta = {
    homepage = "https://github.com/warner/python-spake2";
    description = "SPAKE2 password-authenticated key exchange library";
    license = lib.licenses.mit;
  };
}
