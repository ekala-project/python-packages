{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  yarnConfigHook,
  fetchYarnDeps,
  nodejs,

  setuptools,

  flask,
  werkzeug,
  plotly,
  dash-html-components,
  dash-core-components,
  dash-table,
  importlib-metadata,
  typing-extensions,
  requests,
  retrying,
  nest-asyncio,

  celery,
  kombu,
  redis,
  diskcache,
  multiprocess,
  psutil,
  flask-compress,

  flaky,
  numpy,
  pytest-mock,
  mock,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "dash";
  version = "4.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "plotly";
    repo = "dash";
    tag = "v${finalAttrs.version}";
    hash = "sha256-uZbWX2i9ecD82Hd2aIGTsXUsj1ecJGTAb94ggCndbjk=";
  };

  nativeBuildInputs = [
    yarnConfigHook
    nodejs
  ];

  yarnOfflineCache = fetchYarnDeps {
    yarnLock = "${finalAttrs.src}/@plotly/dash-jupyterlab/yarn.lock";
    hash = "sha256-0dw4c8yHMNReai3QimHFEKlx01OfdW4zXGAl2Q5JB5c=";
  };

  # as of writing this yarnConfigHook has no parameter that changes in which directory it will be run
  # until then we use preConfigure for entering the directory and preBuild for exiting it
  preConfigure = ''
    pushd @plotly/dash-jupyterlab

    substituteInPlace package.json \
        --replace-fail 'jlpm' 'yarn'
  '';

  preBuild = ''
    # Generate the jupyterlab extension files
    yarn --offline run build:pack

    popd
  '';

  build-system = [ setuptools ];

  dependencies = [
    flask
    werkzeug
    plotly
    dash-html-components
    dash-core-components
    dash-table
    importlib-metadata
    typing-extensions
    requests
    retrying
    nest-asyncio
  ];

  pythonRelaxDeps = [
    "werkzeug"
    "flask"
  ];

  optional-dependencies = {
    celery = [
      celery
      kombu
      redis
    ]
    ++ celery.optional-dependencies.redis;
    diskcache = [
      diskcache
      multiprocess
      psutil
    ];
    compress = [ flask-compress ];
  };
  pythonImportsCheck = [ "dash" ];

  meta = {
    description = "Python framework for building analytical web applications";
    homepage = "https://dash.plot.ly/";
    license = lib.licenses.mit;
  };
})
