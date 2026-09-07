{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  certifi,
  setuptools,
  sniffio,
  urllib3,
}:

buildPythonPackage rec {
  pname = "elastic-transport";
  version = "9.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "elastic";
    repo = "elastic-transport-python";
    tag = "v${version}";
    hash = "sha256-LoaZRmHgYE6wndBuTwDqXDh/eqqWGCticY2xX9sIKVw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    certifi
    sniffio
    urllib3
  ];

  doCheck = false;

  pythonImportsCheck = [ "elastic_transport" ];

  meta = {
    description = "Transport classes and utilities shared among Python Elastic client libraries";
    homepage = "https://github.com/elastic/elastic-transport-python";
    license = lib.licenses.asl20;
  };
}
