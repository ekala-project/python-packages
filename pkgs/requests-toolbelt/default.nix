{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "requests-toolbelt";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-doGgo9BHAStb3A7jfX+PB+vnarCMrsz8OSHOI8iNW8Y=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "requests_toolbelt" ];

  meta = {
    description = "A utility belt for advanced users of python-requests";
    homepage = "https://toolbelt.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
