{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pytest-mock,
  twine,
}:

buildPythonPackage (finalAttrs: {
  pname = "hatch-jupyter-builder";
  version = "0.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyterlab";
    repo = "hatch-jupyter-builder";
    tag = "v${finalAttrs.version}";
    hash = "sha256-QDWHVdjtexUNGRL+dVehdBwahSW2HmNkZKkQyuOghyI=";
  };

  build-system = [ hatchling ];

  dependencies = [ hatchling ];
  meta = {
    description = "Hatch plugin to help build Jupyter packages";
    mainProgram = "hatch-jupyter-builder";
    homepage = "https://github.com/jupyterlab/hatch-jupyter-builder";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
