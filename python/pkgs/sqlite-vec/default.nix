{
  lib,
  buildPythonPackage,
  fetchpatch,
  pkgs,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  numpy,
}:

let
  sqlite-vec-c = pkgs.sqlite-vec;
in
buildPythonPackage rec {
  inherit (sqlite-vec-c) pname version src;
  pyproject = true;

  # The actual source root is bindings/python but the patches
  # apply to the bindings directory.
  sourceRoot = "${src.name}/bindings";

  patches = [
    (fetchpatch {
      # https://github.com/asg017/sqlite-vec/pull/233
      name = "add-python-build-files.patch";
      url = "https://github.com/asg017/sqlite-vec/commit/c1917deb11aa79dcac32440679345b93e13b1b86.patch";
      hash = "sha256-4/9QLKuM/1AbD8AQHwJ14rhWVYVc+MILvK6+tWwWQlw=";
      stripLen = 1;
    })
    (fetchpatch {
      # https://github.com/asg017/sqlite-vec/pull/233
      name = "add-python-test.patch";
      url = "https://github.com/asg017/sqlite-vec/commit/608972c9dcbfc7f4583e99fd8de6e5e16da11081.patch";
      hash = "sha256-8dfw7zs7z2FYh8DoAxurMYCDMOheg8Zl1XGcPw1A1BM=";
      stripLen = 1;
    })
  ];

  postPatch = ''
    cd python
    mv extra_init.py sqlite_vec/
    substituteInPlace sqlite_vec/__init__.py \
      --replace-fail "@libpath@" "${lib.getLib sqlite-vec-c}/lib/"
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.0.0"' 'version = "${version}"'
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    sqlite-vec-c
  ];

  optional-dependencies = {
    numpy = [
      numpy
    ];
  };

  pythonImportsCheck = [ "sqlite_vec" ];

  meta = sqlite-vec-c.meta // {
    description = "Python bindings for sqlite-vec";
    maintainers = [ ];
  };
}
