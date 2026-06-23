{
  lib,
  arrow,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "isoduration";
  version = "20.11.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "bolsote";
    repo = "isoduration";
    rev = version;
    hash = "sha256-6LqsH+3V/K0s2YD1gvmelo+cCH+yCAmmyTYGhUegVdk=";
  };

  propagatedBuildInputs = [ arrow ];

  pythonImportsCheck = [ "isoduration" ];

  meta = {
    description = "Library for operations with ISO 8601 durations";
    homepage = "https://github.com/bolsote/isoduration";
    license = lib.licenses.isc;
  };
}
