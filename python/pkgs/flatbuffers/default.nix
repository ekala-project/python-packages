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
    hash = "sha256-l+RRN3pBJi+Nm9QpXMg2EzQVzAPYy5ZkEKSvkusA0m4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "flatbuffers" ];

  meta = {
    description = "Python runtime library for use with the Flatbuffers serialization format";
    homepage = "https://google.github.io/flatbuffers/";
    license = lib.licenses.asl20;
  };
}
