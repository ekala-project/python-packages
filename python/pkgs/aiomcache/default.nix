{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  python-memcached
,
}:

buildPythonPackage rec {
  pname = "aiomcache";
  version = "0.8.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "aiomcache";
    rev = "v${version}";
    hash = "sha256-+rlKHDop0kNxJ0HoXROs/oyI4zE3MDyxXXhWZtVDMj4=";
  };

  build-system = [ setuptools ];

  dependencies = [ python-memcached ];

  pythonImportsCheck = [ "aiomcache" ];

  meta = {
    description = "Minimal asyncio memcached client";
    homepage = "https://github.com/aio-libs/aiomcache/";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
