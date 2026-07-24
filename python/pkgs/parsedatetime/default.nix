{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "parsedatetime";
  version = "2.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TLNo+7GKC3Ix9NdhGRZUUcjS41lRRV3+6XxiqHsE1FU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "parsedatetime" ];

  meta = {
    homepage = "https://github.com/bear/parsedatetime";
    description = "Parse human-readable date/time text";
    license = lib.licenses.asl20;
  };
}
