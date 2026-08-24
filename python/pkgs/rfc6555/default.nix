{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "rfc6555";
  version = "0.1.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "sethmlarson";
    repo = "rfc6555";
    rev = "v${version}";
    hash = "sha256-Lmwgusc4EQlF0GHmMTUxWzUCjBk19cvurNwbOnT+1jM=";
  };

  pythonImportsCheck = [ "rfc6555" ];

  meta = {
    description = "Python implementation of the Happy Eyeballs Algorithm";
    homepage = "https://github.com/sethmlarson/rfc6555";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
