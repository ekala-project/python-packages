{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  requests,
  gevent,
}:

buildPythonPackage rec {
  pname = "grequests";
  version = "0.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XDPxQmjfW4+hEH2FN4Fb5v67rW7FYFJNakBLd3jPa6Y=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    gevent
  ];

  pythonImportsCheck = [ "grequests" ];

  meta = {
    description = "Asynchronous HTTP requests";
    homepage = "https://github.com/kennethreitz/grequests";
    license = lib.licenses.bsd2;
  };
}
