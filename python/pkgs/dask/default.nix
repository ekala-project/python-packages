{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,
  util-linux,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  click,
  cloudpickle,
  fsspec,
  importlib-metadata,
  packaging,
  partd,
  pyyaml,
  toolz,

  # optional-dependencies
  numpy,
  pyarrow,
  lz4,
  pandas,
  distributed,
  bokeh,
  jinja2,

  # tests
  hypothesis,
  psutil,
  pytest-asyncio,
  pytest-cov-stub,
  pytest-mock,
  pytest-rerunfailures,
  pytest-timeout,
  pytest-xdist,
}:

buildPythonPackage (finalAttrs: {
  pname = "dask";
  version = "2026.8.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "dask";
    repo = "dask";
    tag = finalAttrs.version;
    hash = "sha256-DFPd46cBirwztmZJvRKS8u5qvYMEIWfy90QR2AeBu3c=";
  };

  postPatch = lib.optionalString stdenv.hostPlatform.isLinux ''
    substituteInPlace dask/tests/test_system.py \
      --replace-fail \
        '"taskset",' \
        '"${lib.getExe' util-linux "taskset"}",'
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    click
    cloudpickle
    fsspec
    importlib-metadata
    packaging
    partd
    pyyaml
    toolz
  ];

  optional-dependencies = lib.fix (self: {
    array = [ numpy ];
    complete = [
      pyarrow
      lz4
    ]
    ++ self.array
    ++ self.dataframe
    ++ self.distributed
    ++ self.diagnostics;
    dataframe = [
      pandas
      pyarrow
    ]
    ++ self.array;
    distributed = [ distributed ];
    diagnostics = [
      bokeh
      jinja2
    ];
  });
  disabledTestMarks = [
    # Don't run tests that require network access
    "network"
  ];
  pythonImportsCheck = [
    "dask"
    "dask.bag"
    "dask.bytes"
    "dask.diagnostics"
  ];

  meta = {
    description = "Minimal task scheduling abstraction";
    mainProgram = "dask";
    homepage = "https://dask.org/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
