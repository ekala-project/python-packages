{
  lib,
  attrs,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  libcst,
  moreorless,
  stdlibs,
  toml,
  trailrunner,
}:

buildPythonPackage (finalAttrs: {
  pname = "usort";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "facebook";
    repo = "usort";
    tag = "v${finalAttrs.version}";
    hash = "sha256-hoBk8KAml/YOscno9605I3t4z10vQPlh22wH1XHcQqY=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    attrs
    click
    libcst
    moreorless
    stdlibs
    toml
    trailrunner
  ];

  pythonImportsCheck = [ "usort" ];

  meta = {
    description = "Safe, minimal import sorting for Python projects";
    homepage = "https://github.com/facebook/usort";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "usort";
  };
})
