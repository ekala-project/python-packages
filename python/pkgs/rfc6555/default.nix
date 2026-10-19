{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rfc6555";
  version = "0.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sethmlarson";
    repo = "rfc6555";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Lmwgusc4EQlF0GHmMTUxWzUCjBk19cvurNwbOnT+1jM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rfc6555" ];

  meta = {
    description = "Python implementation of the Happy Eyeballs Algorithm";
    homepage = "https://github.com/sethmlarson/rfc6555";
    license = lib.licenses.asl20;
  };
})
