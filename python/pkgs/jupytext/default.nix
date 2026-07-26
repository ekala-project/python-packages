{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  nodejs,
  yarn-berry_3,

  # build-system
  hatch-jupyter-builder,
  hatchling,
  jupyterlab,

  # dependencies
  markdown-it-py,
  mdit-py-plugins,
  nbformat,
  packaging,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "jupytext";
  version = "1.18.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mwouts";
    repo = "jupytext";
    tag = "v${version}";
    hash = "sha256-D7Ps/lHF3F/7Jm4ozcjO8YsTPA1GQPqZVpPod/riGvA=";
  };

  patches = [
    ./fix-yarn-lock-typescript.patch
  ];

  nativeBuildInputs = [
    nodejs
    yarn-berry_3.yarnBerryConfigHook
  ];

  missingHashes = ./missing-hashes.json;

  offlineCache = yarn-berry_3.fetchYarnBerryDeps {
    inherit src missingHashes;
    patches = [
      ./fix-yarn-lock-typescript-offline-cache.patch
    ];
    sourceRoot = "${src.name}/jupyterlab";
    hash = "sha256-k2lQnlSmCghIkp6VwNmq5KpSHS5tEbnFnsM+xqo3Ebw=";
  };

  env.HATCH_BUILD_HOOKS_ENABLE = true;

  preConfigure = ''
    pushd jupyterlab
  '';

  preBuild = ''
    popd
  '';

  build-system = [
    hatch-jupyter-builder
    hatchling
    jupyterlab
  ];

  dependencies = [
    markdown-it-py
    mdit-py-plugins
    nbformat
    packaging
    pyyaml
  ];
  pythonImportsCheck = [
    "jupytext"
    "jupytext.cli"
  ];

  meta = {
    description = "Jupyter notebooks as Markdown documents, Julia, Python or R scripts";
    homepage = "https://github.com/mwouts/jupytext";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "jupytext";
  };
}
