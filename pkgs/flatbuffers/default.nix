{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "flatbuffers";
  version = "25.2.10";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-UKzMMIkGz6ruOb82IS43p8IzS/kd/e4ISo0pVIqxb4I=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "flatbuffers" ];

  meta = {
    description = "Python runtime library for use with the Flatbuffers serialization format";
    homepage = "https://google.github.io/flatbuffers/";
    license = lib.licenses.asl20;
  };
}
