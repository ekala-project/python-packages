{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  aiodns,
  aiohttp,
  azure-core,
  certifi,
  isodate,
  requests,
  requests-oauthlib,
}:

buildPythonPackage {
  pname = "msrest";
  version = "0.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Azure";
    repo = "msrest-for-python";
    # no tag for 0.7.1 see:
    # https://github.com/Azure/msrest-for-python/issues/254
    rev = "2d8fd04f68a124d0f3df7b81584accc3270b1afc";
    hash = "sha256-1EXXXflhDeU+erdI+NsWxSX76ooDTl3+MyQwRzm2xV0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiodns
    aiohttp
    azure-core
    certifi
    isodate
    requests
    requests-oauthlib
  ];

  pythonImportsCheck = [ "msrest" ];

  meta = {
    description = "Runtime library for AutoRest generated Python clients";
    homepage = "https://github.com/Azure/msrest-for-python";
    license = lib.licenses.mit;
  };
}
