{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  aiohttp,
  click,
  colorama,
  hatch-fancy-pypi-readme,
  hatch-vcs,
  hatchling,
  ipython,
  mypy-extensions,
  packaging,
  pathspec,
  platformdirs,
  pytokens,
  tokenize-rt,
  uvloop,
}:

buildPythonPackage (finalAttrs: {
  pname = "black";
  version = "26.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "psf";
    repo = "black";
    tag = finalAttrs.version;
    hash = "sha256-xALg9ta0U2V6i/b7VYiPKu0oNnHfg9T+XuK3CvqJmjs=";
  };

  build-system = [
    hatch-fancy-pypi-readme
    hatch-vcs
    hatchling
  ];

  dependencies = [
    click
    mypy-extensions
    packaging
    pathspec
    platformdirs
    pytokens
  ];

  optional-dependencies = {
    colorama = [ colorama ];
    d = [ aiohttp ];
    uvloop = [ uvloop ];
    jupyter = [
      ipython
      tokenize-rt
    ];
  };

  # Necessary for the tests to pass on Darwin with sandbox enabled.
  # Black starts a local server and needs to bind a local address.
  # multiple tests exceed max open files on hydra builders
  doCheck = !(stdenv.hostPlatform.isLinux && stdenv.hostPlatform.isAarch64);

  meta = {
    description = "Uncompromising Python code formatter";
    homepage = "https://github.com/psf/black";
    license = lib.licenses.mit;
    mainProgram = "black";
    maintainers = [ ];
  };
})
