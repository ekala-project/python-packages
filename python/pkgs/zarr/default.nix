{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  donfig,
  numpy,
  numcodecs,
  google-crc32c,
  packaging,
  typing-extensions,

  # optional-dependencies
  fsspec,
  typer,
  rich,
  universal-pathlib,
}:

buildPythonPackage (finalAttrs: {
  pname = "zarr";
  version = "3.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zarr-developers";
    repo = "zarr-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-WExQT/Je+esq0dv9HtPxGt7ioJgIwW8cGNuPwM+ANEc=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    donfig
    numcodecs
    google-crc32c
    numpy
    packaging
    typing-extensions
  ];

  passthru = {
    optional-dependencies = {
      remote = [
        fsspec
      ];
      cli = [
        typer
      ];
      optional = [
        rich
        universal-pathlib
      ];
    };
  };

  pythonImportsCheck = [ "zarr" ];

  meta = {
    description = "Implementation of chunked, compressed, N-dimensional arrays for Python";
    homepage = "https://github.com/zarr-developers/zarr";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
