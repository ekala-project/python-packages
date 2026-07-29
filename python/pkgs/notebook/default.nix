{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  nodejs,
  yarn-berry_3,
  distutils,

  # build-system
  hatch-jupyter-builder,
  hatchling,
  jupyterlab,

  # dependencies
  jupyter-server,
  jupyterlab-server,
  notebook-shim,
  tornado,
}:

buildPythonPackage rec {
  pname = "notebook";
  version = "7.5.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyter";
    repo = "notebook";
    tag = "v${version}";
    hash = "sha256-xEwXiYQ7OiQ4dEL4ewP+yr3tGsWqa1hAUIl0Th48aiU=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "timeout = 300" ""
  '';

  nativeBuildInputs = [
    nodejs
    yarn-berry_3.yarnBerryConfigHook
  ]
  ++ lib.optionals (stdenv.hostPlatform.isLinux && stdenv.hostPlatform.isAarch64) [
    distutils
  ];

  missingHashes = ./missing-hashes.json;

  offlineCache = yarn-berry_3.fetchYarnBerryDeps {
    inherit src missingHashes;
    hash = "sha256-BdoAtG7Dc+ZTBn4bCraAIazvXiZyvG5u97pcwvptjBY=";
  };

  build-system = [
    hatch-jupyter-builder
    hatchling
    jupyterlab
  ];

  dependencies = [
    jupyter-server
    jupyterlab
    jupyterlab-server
    notebook-shim
    tornado
  ];
  env = {
    CI = 1; # quiet lerna progress bar
    JUPYTER_PLATFORM_DIRS = 1;
  };

  # Some of the tests use localhost networking.
  meta = {
    description = "Web-based notebook environment for interactive computing";
    homepage = "https://github.com/jupyter/notebook";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    mainProgram = "jupyter-notebook";
  };
}
