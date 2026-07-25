{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  setuptools,

  # optional-dependencies
  aiohttp,
  pydantic,
  flask,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "dependency-injector";
  version = "4.49.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "ets-labs";
    repo = "python-dependency-injector";
    tag = finalAttrs.version;
    hash = "sha256-ncxKYzkV10hA2D8U1/zvkYJ/VFhNUsvRaOBNjzhIdtA=";
  };

  build-system = [
    cython
    setuptools
  ];

  optional-dependencies = {
    aiohttp = [ aiohttp ];
    pydantic = [ pydantic ];
    flask = [ flask ];
    yaml = [ pyyaml ];
  };
  meta = {
    description = "Dependency injection microframework for Python";
    homepage = "https://github.com/ets-labs/python-dependency-injector";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
