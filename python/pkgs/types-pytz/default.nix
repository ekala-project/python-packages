{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "types-pytz";
  version = "2026.6.0.20261031";
  pyproject = true;

  src = fetchPypi {
    pname = "types_pytz";
    inherit (finalAttrs) version;
    hash = "sha256-i1WZVfDGKPaBWYZcbySDX0MjxAekQINls2dqB0tSQmE=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Typing stubs for pytz";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
})
