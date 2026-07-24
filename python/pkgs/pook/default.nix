{
  lib,
  buildPythonPackage,
  falcon,
  fetchFromGitHub,
  furl,
  hatchling,
  jsonschema,
  pytest-asyncio,
  pytest-httpbin,
  pytest-pook,
  xmltodict,
}:

buildPythonPackage rec {
  pname = "pook";
  version = "2.1.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "h2non";
    repo = "pook";
    tag = "v${version}";
    hash = "sha256-pStAlxhyZ1eDER17yLYc1r+kGpEZFW+mi0y3nrPA1CQ=";
  };

  build-system = [ hatchling ];

  dependencies = [
    furl
    jsonschema
    xmltodict
  ];
  pythonImportsCheck = [ "pook" ];
  # Tests use sockets
  meta = {
    description = "HTTP traffic mocking and testing";
    homepage = "https://github.com/h2non/pook";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
