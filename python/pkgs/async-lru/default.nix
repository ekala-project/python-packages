{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "async-lru";
  version = "2.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "async-lru";
    tag = "v${version}";
    hash = "sha256-ytmh6tY6AS2VHajCnnRBSi0i57DUu+ikpbil/RwFyYA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "async_lru" ];

  meta = {
    description = "Simple lru cache for asyncio";
    homepage = "https://github.com/wikibusiness/async_lru";
    license = lib.licenses.mit;
  };
}
