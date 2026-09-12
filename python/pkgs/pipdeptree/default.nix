{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  graphviz,
  hatchling,
  hatch-vcs,
  packaging,
  pip-requirements-parser,
  pytest-mock,
  pytest-subprocess,
  rich,
  virtualenv,
}:

buildPythonPackage (finalAttrs: {
  pname = "pipdeptree";
  version = "3.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tox-dev";
    repo = "pipdeptree";
    tag = finalAttrs.version;
    hash = "sha256-EDpKJBDb3CkTMfiLyYMakbm5riIHsf+49yM99uQDPT8=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [ packaging ];

  optional-dependencies = {
    graphviz = [ graphviz ];
    index = [
      # nab-index # Unstable + not packaged yet
      # nab-python # Same
      pip-requirements-parser
    ];
    rich = [ rich ];
  };
  meta = {
    description = "Command line utility to show dependency tree of packages";
    homepage = "https://github.com/tox-dev/pipdeptree";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "pipdeptree";
  };
})
