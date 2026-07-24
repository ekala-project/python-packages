{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  click,
  cloudpickle,
  dask,
  jinja2,
  locket,
  msgpack,
  packaging,
  psutil,
  pyyaml,
  sortedcontainers,
  tblib,
  toolz,
  tornado,
  zict,
}:

buildPythonPackage (finalAttrs: {
  pname = "distributed";
  version = "2026.7.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "dask";
    repo = "distributed";
    tag = finalAttrs.version;
    hash = "sha256-JwN+Ey+Ii8mELa6oVS+SDiOPYyMcKdaiSjjMqDze+kc=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonRelaxDeps = [ "dask" ];

  dependencies = [
    click
    cloudpickle
    dask
    jinja2
    locket
    msgpack
    packaging
    psutil
    pyyaml
    sortedcontainers
    tblib
    toolz
    tornado
    zict
  ];

  # When tested random tests would fail and not repeatably
  doCheck = false;

  pythonImportsCheck = [ "distributed" ];

  meta = {
    description = "Distributed computation in Python";
    homepage = "https://distributed.readthedocs.io/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
