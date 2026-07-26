{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  uv-dynamic-versioning,

  # optional dependencies
  filelock,
  psycopg,
  psycopg-pool,
  redis,
}:

buildPythonPackage rec {
  pname = "pyrate-limiter";
  version = "4.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vutran1710";
    repo = "PyrateLimiter";
    tag = "v${version}";
    hash = "sha256-DT4WyGrayI12Sid6yLOit68vW/YT4cHsRYjd4oo0/J8=";
  };

  build-system = [
    hatchling
    uv-dynamic-versioning
  ];

  optional-dependencies = {
    all = [
      filelock
      redis
      psycopg
      psycopg-pool
    ];
  };

  pythonImportsCheck = [ "pyrate_limiter" ];

  meta = {
    description = "Python Rate-Limiter using Leaky-Bucket Algorimth Family";
    homepage = "https://github.com/vutran1710/PyrateLimiter";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
