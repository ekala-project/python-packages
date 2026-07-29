{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pkg-config,
  cmake,
  setuptools,
  pkgs,
  texttable,
  cairocffi,
  matplotlib,
  plotly,
}:

let
  igraph-c = pkgs.igraph;
in
buildPythonPackage rec {
  pname = "igraph";
  version = "1.0.0";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "igraph";
    repo = "python-igraph";
    tag = version;
    postFetch = ''
      # export-subst prevents reproducability
      rm $out/.git_archival.json
    '';
    hash = "sha256-Y7ZQ1yNoD8A5b6c92OGz9Unietdg1uNt/Za6nxdCSP0=";
  };

  postPatch = ''
    rm -r vendor
  '';

  nativeBuildInputs = [ pkg-config ];

  build-system = [
    cmake
    setuptools
  ];

  dontUseCmakeConfigure = true;

  buildInputs = [ igraph-c ];

  dependencies = [ texttable ];

  optional-dependencies = {
    cairo = [ cairocffi ];
    matplotlib = [ matplotlib ];
    plotly = [ plotly ];
    plotting = [ cairocffi ];
  };

  env.IGRAPH_USE_PKG_CONFIG = true;

  pythonImportsCheck = [ "igraph" ];

  meta = {
    description = "High performance graph data structures and algorithms";
    mainProgram = "igraph";
    homepage = "https://igraph.org/python/";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
  };
}
