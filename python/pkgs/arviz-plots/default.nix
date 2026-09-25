{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # dependencies
  arviz-base,
  arviz-stats,

  # optional-dependencies
  bokeh,
  matplotlib,
  plotly,
  webcolors,
}:

buildPythonPackage (finalAttrs: {
  pname = "arviz-plots";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arviz-devs";
    repo = "arviz-plots";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1HRgzLYuJGuWIGJnUZf7sbJCep+re5/FidCw3/SCH1Q=";
  };

  build-system = [ flit-core ];

  dependencies = [
    arviz-base
    arviz-stats
  ]
  ++ arviz-stats.optional-dependencies.xarray;

  optional-dependencies = {
    bokeh = [ bokeh ];
    matplotlib = [ matplotlib ];
    plotly = [
      plotly
      webcolors
    ];
  };

  pythonImportsCheck = [ "arviz_plots" ];

  meta = {
    description = "ArviZ modular plotting";
    homepage = "https://github.com/arviz-devs/arviz-plots";
    license = lib.licenses.asl20;
  };
})
