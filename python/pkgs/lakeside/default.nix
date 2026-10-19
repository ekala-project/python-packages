{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  protobuf,
  pycryptodome,
  requests,
}:

buildPythonPackage rec {
  pname = "lakeside";
  version = "0.13";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nkgilley";
    repo = "python-lakeside";
    tag = version;
    hash = "sha256-Y5g78trkwOF3jsbgTv0uVkvfB1HZN+w1T6xIorxGAhg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    protobuf
    pycryptodome
    requests
  ];

  # Module has no tests

  pythonImportsCheck = [ "lakeside" ];

  meta = {
    description = "Library for controlling LED bulbs from Eufy";
    homepage = "https://github.com/nkgilley/python-lakeside";
    license = lib.licenses.asl20;
  };
}
