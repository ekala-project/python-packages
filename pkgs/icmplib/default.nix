{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "icmplib";
  version = "3.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ValentinBELYN";
    repo = "icmplib";
    tag = "v${version}";
    hash = "sha256-PnBcGiUvftz/KYg9Qd2GaIcF3OW4lYH301uI5/M5CBI=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "icmplib" ];

  meta = {
    description = "Python implementation of the ICMP protocol";
    homepage = "https://github.com/ValentinBELYN/icmplib";
    license = lib.licenses.lgpl3Plus;
  };
}
