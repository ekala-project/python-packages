{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "fivem-api";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6llrMGWbDRmysEw+B6B115hLS5xlktQEXiSHzPLbV5s=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  dependencies = [ aiohttp ];

  # Module has no tests

  pythonImportsCheck = [ "fivem" ];

  meta = {
    description = "Module for interacting with FiveM servers";
    homepage = "https://github.com/Sander0542/fivem-api";
    license = lib.licenses.mit;
  };
}
