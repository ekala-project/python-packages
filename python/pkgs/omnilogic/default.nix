{
  lib,
  aiohttp,
  xmltodict,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "omnilogic";
  version = "0.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "djtimca";
    repo = "omnilogic-api";
    tag = version;
    hash = "sha256-ySK2T5T+Qdq8nVQqluIARR89KmM1N3oD44oLydwcs7E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    xmltodict
  ];

  # Project has no tests

  pythonImportsCheck = [ "omnilogic" ];

  meta = {
    description = "Python interface for the Hayward Omnilogic pool control system";
    homepage = "https://github.com/djtimca/omnilogic-api";
    license = lib.licenses.asl20;
  };
}
