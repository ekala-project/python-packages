{
  lib,
  anyio,
  buildPythonPackage,
  fetchFromGitHub,
  flaky,
  hatchling,
  hatch-vcs,
  memray,
  pytest,
  pytest-xdist,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-memray";
  version = "1.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bloomberg";
    repo = "pytest-memray";
    tag = "v${finalAttrs.version}";
    hash = "sha256-jtbtgN3x99vpJ+CWew+pkK1VXdviw4JWNQIB/oKlPWs=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [ memray ];

  buildInputs = [ pytest ];
  pythonImportsCheck = [ "pytest_memray" ];

  meta = {
    description = "Pytest plugin for easy integration of memray memory profiler";
    homepage = "https://github.com/bloomberg/pytest-memray";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
