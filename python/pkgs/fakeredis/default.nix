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
  version = "2.37.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dGHxJNy6BKgGkdcicLPR1c0QDvFNwGjHbbgllA8+15k=";
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
