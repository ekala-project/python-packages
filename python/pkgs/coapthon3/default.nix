{
  buildPythonPackage,
  cachetools,
  fetchFromGitHub,
  # build-system
  setuptools,
  lib,
}:

buildPythonPackage rec {
  pname = "coapthon3";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Tanganelli";
    repo = "CoAPthon3";
    tag = version;
    hash = "sha256-9QApoPUu3XFZY/lgjAsf5r2StFiRtUd1UXWDrzYUh6w=";
  };

  build-system = [ setuptools ];

  dependencies = [ cachetools ];

  # tests take in the order of 10 minutes to execute and sometimes hang forever on tear-down
  pythonImportsCheck = [ "coapthon" ];

  meta = {
    inherit (src.meta) homepage;
    description = "Python3 library to the CoAP protocol compliant with the RFC";
    license = lib.licenses.mit;
  };
}
