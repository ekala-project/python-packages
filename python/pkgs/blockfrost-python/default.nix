{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # Python deps
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "blockfrost-python";
  version = "0.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "blockfrost";
    repo = "blockfrost-python";
    tag = version;
    hash = "sha256-2NuWUK1DthGnMTbZQIaDvF9VF2dVLgYrCUKJIxuq1V0=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    requests
  ];

  pythonImportsCheck = [ "blockfrost" ];

  meta = {
    description = "Python SDK for the Blockfrost.io API";
    homepage = "https://github.com/blockfrost/blockfrost-python";
    license = lib.licenses.asl20;
  };
}
