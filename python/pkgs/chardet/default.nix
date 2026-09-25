{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "chardet";
  version = "7.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "chardet";
    repo = "chardet";
    tag = finalAttrs.version;
    hash = "sha256-7xloMYaoAB1uwj4/5KK8PFd/mjXTgMFjS0SGW7Rrynw=";
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
  };
})
