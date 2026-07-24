{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  beautifulsoup4,
  bleach,
  defusedxml,
  jinja2,
  jupyter-core,
  jupyterlab-pygments,
  markupsafe,
  mistune,
  nbclient,
  packaging,
  pandocfilters,
  pygments,
  traitlets,
}:

buildPythonPackage rec {
  pname = "nbconvert";
  version = "7.17.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NNDQp+c848urbFquj09Gh5coCwH9i9LKdG2oVp7d19I=";
  };

  # Add $out/share/jupyter to the list of paths that are used to search for
  # various exporter templates
  patches = [ ./templates.patch ];

  postPatch = ''
    substituteAllInPlace ./nbconvert/exporters/templateexporter.py
  '';

  build-system = [ hatchling ];

  dependencies = [
    beautifulsoup4
    bleach
    defusedxml
    jinja2
    jupyter-core
    jupyterlab-pygments
    markupsafe
    mistune
    nbclient
    packaging
    pandocfilters
    pygments
    traitlets
  ]
  ++ bleach.optional-dependencies.css;
  # Some of the tests use localhost networking.
  meta = {
    description = "Converting Jupyter Notebooks";
    homepage = "https://github.com/jupyter/nbconvert";
    license = lib.licenses.bsd3;
    teams = [ lib.teams.jupyter ];
  };
}
