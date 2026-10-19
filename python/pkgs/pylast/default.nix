{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  httpx2,
}:

buildPythonPackage (finalAttrs: {
  pname = "pylast";
  version = "7.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pylast";
    repo = "pylast";
    tag = finalAttrs.version;
    hash = "sha256-Vo916wcaEkrKftBoe+6P7DpYsyILoAcZLt3rpIGKu/c=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [ httpx2 ];

  pythonImportsCheck = [ "pylast" ];

  meta = {
    description = "Python interface to last.fm (and compatibles)";
    homepage = "https://github.com/pylast/pylast";
    license = lib.licenses.asl20;
  };
})
