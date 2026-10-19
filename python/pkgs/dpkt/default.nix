{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "dpkt";
  version = "1.9.8";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Q/hobkVdpQUoNf0e2iaJ1R3jZwqsl5mxsAz9IDkn7kU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dpkt" ];

  meta = {
    description = "Fast, simple packet creation / parsing, with definitions for the basic TCP/IP protocols";
    homepage = "https://github.com/kbandla/dpkt";
    license = lib.licenses.bsd3;
  };
})
