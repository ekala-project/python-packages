{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  urllib3,
}:

buildPythonPackage rec {
  pname = "types-requests";
  version = "2.33.0.20260906";
  pyproject = true;

  src = fetchPypi {
    pname = "types_requests";
    inherit version;
    hash = "sha256-dquKD7c2dEoMPe7nqleykn4wHweNnmH1ORs+kgAkFrk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    urllib3
  ];

  # Module doesn't have tests
  doCheck = false;

  pythonImportsCheck = [ "requests-stubs" ];

  meta = {
    description = "Typing stubs for requests";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
}
