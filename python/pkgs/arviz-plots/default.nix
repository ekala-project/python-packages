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
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arviz-devs";
    repo = "arviz-plots";
    tag = "v${finalAttrs.version}";
    hash = "sha256-C08HLWnCixreeMj5imN7iOnYgYUZZ3+XG0lPExL4O1c=";
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
    maintainers = [ ];
  };
})
