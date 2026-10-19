{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:
buildPythonPackage {
  pname = "pyscreeze";
  version = "0.1.26";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "asweigart";
    repo = "pyscreeze";
    rev = "28ab707dceecbdd135a9491c3f8effd3a69680af";
    hash = "sha256-gn3ydjf/msdhIhngGlhK+jhEyFy0qGeDr58E7kM2YZs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyscreeze" ];
  doCheck = stdenv.hostPlatform.isLinux;
  meta = {
    description = "PyScreeze is a simple, cross-platform screenshot module for Python 2 and 3";
    homepage = "https://github.com/asweigart/pyscreeze";
    license = lib.licenses.bsd3;
  };
}
