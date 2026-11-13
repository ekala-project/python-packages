{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,
  pkgs, # graphviz is shadowed by python3Packages.graphviz
  coreutils,
  pkg-config,
  setuptools,
  swig,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "pygraphviz";
  version = "2.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pygraphviz";
    repo = "pygraphviz";
    tag = "pygraphviz-${finalAttrs.version}";
    hash = "sha256-PPRpBXL+AuGukLXehFvRpZ9LCJSeVXf51ktPrsIlEys=";
  };

  patches = [
    # pygraphviz depends on graphviz executables and wc being in PATH
    (replaceVars ./path.patch {
      path = lib.makeBinPath [
        pkgs.graphviz
        coreutils
      ];
    })
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail ', "swig>4.1.0"' ""
  '';

  env.GRAPHVIZ_PREFIX = pkgs.graphviz;

  build-system = [
    setuptools
  ];

  nativeBuildInputs = [
    pkgs.graphviz # for dot
    pkg-config
    swig
  ];

  buildInputs = [ pkgs.graphviz ];
  checkPhase = ''
    runHook preCheck
    pytest --pyargs pygraphviz
    runHook postCheck
  '';

  pythonImportsCheck = [ "pygraphviz" ];

  meta = {
    description = "Python interface to Graphviz graph drawing package";
    homepage = "https://github.com/pygraphviz/pygraphviz";
    license = lib.licenses.bsd3;
  };
})
