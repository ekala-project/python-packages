{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "dnslib";
  version = "0.9.26";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vlaFdTQ5Cy+9ApNScAGbrMXmtBHRVss5IaxVp/tR8ag=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dnslib" ];

  meta = {
    description = "Simple library to encode/decode DNS wire-format packets";
    homepage = "https://github.com/paulc/dnslib";
    license = lib.licenses.bsd2;
  };
}
