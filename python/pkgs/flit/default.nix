{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # dependencies
  docutils,
  pip,
  requests,
  tomli-w,
}:

# Flit is actually an application to build universal wheels.
# It requires Python 3 and should eventually be moved outside of
# python-packages.nix. When it will be used to build wheels,
# care should be taken that there is no mingling of PYTHONPATH.

buildPythonPackage rec {
  pname = "flit";
  version = "3.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pypa";
    repo = "flit";
    rev = version;
    hash = "sha256-oWV+KK22+iK99iCOCKCV1OCLq2Ef1bcYRKXT5GHwiL8=";
  };

  build-system = [ flit-core ];

  dependencies = [
    docutils
    flit-core
    pip
    requests
    tomli-w
  ];
  meta = {
    description = "Simple packaging tool for simple packages";
    mainProgram = "flit";
    homepage = "https://github.com/pypa/flit";
    license = lib.licenses.bsd3;
  };
}
