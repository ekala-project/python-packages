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
  version = "0.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyterlab";
    repo = "hatch-jupyter-builder";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ovLOILJYHrSAzmw9R1Qr7EqwxaZvzAaINQ6+LGINTvo=";
  };

  build-system = [ hatchling ];

  dependencies = [ hatchling ];
  meta = {
    description = "Hatch plugin to help build Jupyter packages";
    mainProgram = "hatch-jupyter-builder";
    homepage = "https://github.com/jupyterlab/hatch-jupyter-builder";
    license = lib.licenses.bsd3;
  };
})
