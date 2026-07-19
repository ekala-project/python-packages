{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "railroad-diagrams";
  version = "3.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qRMyuskAyzw2czH6m2mfCJe8+GtyZPZUWGdd9DDQTOM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "railroad" ];

  meta = {
    description = "Module to generate SVG railroad syntax diagrams";
    homepage = "https://github.com/tabatkins/railroad-diagrams";
    license = lib.licenses.cc0;
  };
}
