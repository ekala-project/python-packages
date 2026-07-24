{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  bitstruct,
  pyparsing,

  # optional-dependencies
  prompt-toolkit,
  diskcache,

  # tests
  pytest-xdist,
}:

buildPythonPackage rec {
  pname = "asn1tools";
  version = "0.167.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "eerimoq";
    repo = "asn1tools";
    tag = version;
    hash = "sha256-86bdBYlAVJfd3EY8s0t6ZDRA/qZVWuHD4Jxa1n1Ke5E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    bitstruct
    pyparsing
  ];

  optional-dependencies = {
    shell = [ prompt-toolkit ];
    cache = [ diskcache ];
  };
  meta = {
    description = "ASN.1 parsing, encoding and decoding";
    homepage = "https://github.com/eerimoq/asn1tools";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "asn1tools";
  };
}
