{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "uncalled-for";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "chrisguidry";
    repo = "uncalled-for";
    tag = finalAttrs.version;
    hash = "sha256-owpWPOV70z1NCpfVOGlyczfqrPR8Yyd7SUzY9wWZiXU=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  pythonImportsCheck = [ "uncalled_for" ];

  meta = {
    description = "Async dependency injection for Python functions";
    homepage = "https://github.com/chrisguidry/uncalled-for";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
