{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  certifi,
  setuptools,
  urllib3,
}:

buildPythonPackage rec {
  pname = "elastic-transport";
  version = "8.17.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "elastic";
    repo = "elastic-transport-python";
    tag = "v${version}";
    hash = "sha256-LWSvE88wEwMxRi6IZsMkIRP8UTRfImC9QZnuka1oiso=";
  };

  # FIXME: backport fix for pytest-asyncio 1.2.0, as updating this entire ecosystem is painful
  patches = [
    (fetchpatch {
      url = "https://github.com/elastic/elastic-transport-python/commit/d749d0be54821e81979888ff34b1451354548863.patch";
      hash = "sha256-FrabqeLn3Sr1sg/lWWYsMPd0CZS/6BZYLnaK66T93BQ=";
    })
  ];

  build-system = [ setuptools ];

  dependencies = [
    urllib3
    certifi
  ];

  doCheck = false;

  pythonImportsCheck = [ "elastic_transport" ];

  meta = {
    description = "Transport classes and utilities shared among Python Elastic client libraries";
    homepage = "https://github.com/elastic/elastic-transport-python";
    license = lib.licenses.asl20;
  };
}
