{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cryptography,
}:

buildPythonPackage rec {
  pname = "pyspnego";
  version = "0.12.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RIpJGpvw5fuVdWf+RuaAn6g2qkDfzM68x0C7ZKyxvhw=";
  };

  build-system = [ setuptools ];

  dependencies = [ cryptography ];

  pythonImportsCheck = [ "spnego" ];

  meta = {
    description = "Python SPNEGO authentication library";
    homepage = "https://github.com/jborean93/pyspnego";
    license = lib.licenses.mit;
  };
}
