{
  lib,
  aiohttp,
  brotlipy,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  yarl,
}:

buildPythonPackage rec {
  pname = "garminconnect-aio";
  version = "0.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cyberjunky";
    repo = "python-garminconnect-aio";
    tag = version;
    hash = "sha256-GWY2kTG2D+wOJqM/22pNV5rLvWjAd4jxVGlHBou/T2g=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    brotlipy
    yarl
  ];

  # Project has no tests

  pythonImportsCheck = [ "garminconnect_aio" ];

  meta = {
    description = "Python module to interact with Garmin Connect";
    homepage = "https://github.com/cyberjunky/python-garminconnect-aio";
    license = lib.licenses.mit;
  };
}
