{
  lib,
  buildPythonPackage,
  fetchPypi,
}:

buildPythonPackage rec {
  pname = "h11";
  version = "0.16.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TjW5Vs9FeS5MqliF5p+6AL28b/r7+gIDAOVJsgjuX/E=";
  };

  pythonImportsCheck = [ "h11" ];

  meta = {
    description = "Pure-Python, bring-your-own-I/O implementation of HTTP/1.1";
    homepage = "https://github.com/python-hyper/h11";
    license = lib.licenses.mit;
  };
}
