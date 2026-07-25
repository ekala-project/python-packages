{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "chardet";
  version = "6.0.0.post1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "chardet";
    repo = "chardet";
    tag = finalAttrs.version;
    hash = "sha256-7G998L4VRvNiGBBNAxPJB27lI2DtL1lTteowUH2NBDk=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];
  pythonImportsCheck = [ "chardet" ];

  meta = {
    description = "Universal encoding detector";
    mainProgram = "chardetect";
    homepage = "https://github.com/chardet/chardet";
    license = lib.licenses.lgpl21Plus;
    maintainers = [ ];
  };
})
