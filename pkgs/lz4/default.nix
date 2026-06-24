{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  pkgconfig,
  pkg-config,
}:

buildPythonPackage (finalAttrs: {
  pname = "lz4";
  version = "4.4.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-lz4";
    repo = "python-lz4";
    tag = "v${finalAttrs.version}";
    hash = "sha256-2D30n5j5r4+gcrjEXPu+WpZ4QsugCPyC1xCZuJIPcI0=";
  };

  build-system = [
    setuptools-scm
    setuptools
    pkgconfig
  ];

  nativeBuildInputs = [ pkg-config ];

  # for lz4.steam
  env.PYLZ4_EXPERIMENTAL = true;

  pythonImportsCheck = [
    "lz4"
    "lz4.block"
    "lz4.frame"
    "lz4.stream"
  ];

  meta = {
    description = "LZ4 Bindings for Python";
    homepage = "https://github.com/python-lz4/python-lz4";
    license = lib.licenses.bsd3;
  };
})
