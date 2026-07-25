{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage rec {
  pname = "platformdirs";
  version = "4.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tox-dev";
    repo = "platformdirs";
    tag = version;
    hash = "sha256-Sx5ln2mF2FkChP3UKu+GmOIIV8DNoJyYgsNiVDkVqQE=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];
  pythonImportsCheck = [ "platformdirs" ];
  meta = {
    description = "Module for determining appropriate platform-specific directories";
    homepage = "https://platformdirs.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
