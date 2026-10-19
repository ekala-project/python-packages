{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # build inputs
  tblib,
  pytest,
  py,
}:
let
  pname = "pytest-parallel";
  version = "0.1.1";
in
buildPythonPackage {
  inherit pname version;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kevlened";
    repo = "pytest-parallel";
    tag = version;
    hash = "sha256-ddpoWBTf7Zor569p6uOMjHSTx3Qa551f4mSwyTLDdBU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    tblib
    pytest
    py
  ];

  meta = {
    description = "Pytest plugin for parallel and concurrent testing";
    homepage = "https://github.com/kevlened/pytest-parallelt";
    license = lib.licenses.mit;
  };
}
