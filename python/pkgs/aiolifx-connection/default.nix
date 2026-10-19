{
  lib,
  fetchPypi,
  # build-system
  setuptools,
  buildPythonPackage,
  aiolifx,
}:

buildPythonPackage rec {
  pname = "aiolifx-connection";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "aiolifx_connection";
    inherit version;
    hash = "sha256:09fydp5fqqh1s0vav39mw98i1la6qcgk17gch0m5ihyl9q50ks13";
  };

  build-system = [ setuptools ];

  dependencies = [ aiolifx ];

  # tests are not implemented

  pythonImportsCheck = [ "aiolifx_connection" ];

  meta = {
    description = "Wrapper for aiolifx to connect to a single LIFX device";
    homepage = "https://github.com/bdraco/aiolifx_connection";
    license = lib.licenses.bsd3;
  };
}
