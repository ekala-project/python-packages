{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  requests,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "transmission-rpc";
  version = "7.0.12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Trim21";
    repo = "transmission-rpc";
    tag = "v${version}";
    hash = "sha256-BxbaBUzu/KPn/4AoRmIEBI+v3+mjJAXF9lzm0wNb25c=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    typing-extensions
  ];

  pythonImportsCheck = [ "transmission_rpc" ];

  meta = {
    description = "Python module that implements the Transmission bittorent client RPC protocol";
    homepage = "https://github.com/Trim21/transmission-rpc";
    license = lib.licenses.mit;
  };
}
