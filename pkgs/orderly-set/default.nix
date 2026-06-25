{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage rec {
  pname = "orderly-set";
  version = "5.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "seperman";
    repo = "orderly-set";
    tag = version;
    hash = "sha256-xrxH/LB+cyZlVf+sVwOtAf9+DojYPDnudHpqlVuARLg=";
  };

  build-system = [
    flit-core
  ];

  pythonImportsCheck = [
    "orderly_set"
  ];

  meta = {
    description = "Multiple implementations of Ordered Set";
    homepage = "https://github.com/seperman/orderly-set";
    license = lib.licenses.mit;
  };
}
