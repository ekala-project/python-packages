{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  redis,
  sortedcontainers,
}:

buildPythonPackage rec {
  pname = "fakeredis";
  version = "2.36.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-w3oLMH+uPyfsfBnllRnle4xSeC4AMD35B1NhtbpEG+Y=";
  };

  build-system = [ hatchling ];

  dependencies = [
    redis
    sortedcontainers
  ];

  pythonImportsCheck = [ "fakeredis" ];

  meta = {
    description = "Fake implementation of Redis API";
    homepage = "https://github.com/cunla/fakeredis-py";
    license = lib.licenses.bsd3;
  };
}
