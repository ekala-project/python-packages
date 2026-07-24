{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  aiohttp,
}:

buildPythonPackage rec {
  pname = "aiohttp-wsgi";
  version = "0.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "etianen";
    repo = "aiohttp-wsgi";
    rev = "v${version}";
    hash = "sha256-3Q00FidZWV1KueuHyHKQf1PsDJGOaRW6v/kBy7lzD4Q=";
  };

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];

  pythonImportsCheck = [ "aiohttp_wsgi" ];

  meta = {
    description = "WSGI adapter for aiohttp";
    mainProgram = "aiohttp-wsgi-serve";
    homepage = "https://github.com/etianen/aiohttp-wsgi";
    license = lib.licenses.bsd3;
  };
}
