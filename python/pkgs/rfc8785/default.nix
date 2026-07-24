{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage rec {
  pname = "rfc8785";
  version = "0.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "trailofbits";
    repo = "rfc8785.py";
    tag = "v${version}";
    hash = "sha256-0Gze3voFXEhf13DuTuBWDbYPmqHXs0FSRn2NprFWoB8=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "rfc8785" ];

  meta = {
    description = "Module for RFC8785 (JSON Canonicalization Scheme)";
    homepage = "https://github.com/trailofbits/rfc8785.py";
    license = lib.licenses.asl20;
  };
}
