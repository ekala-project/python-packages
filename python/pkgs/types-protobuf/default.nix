{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "types-protobuf";
  version = "7.35.1.20260906";
  pyproject = true;

  src = fetchPypi {
    pname = "types_protobuf";
    inherit version;
    hash = "sha256-79Gjhi1Mln2tVRLvjVaxUwrITxgsQXNblABHVlGMSZg=";
  };

  build-system = [ setuptools ];

  # Module doesn't have tests
  doCheck = false;

  pythonImportsCheck = [ "google-stubs" ];

  meta = {
    description = "Typing stubs for protobuf";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
}
