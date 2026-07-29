{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  distlib,
  grpcio-tools,
  jinja2,
  jsonpickle,
  jsonschema,
  mypy-protobuf,
  redis,
  setuptools,
  yapf,

  # dependencies
  beartype,
  crcmod,
  cryptography,
  dill,
  envoy-data-plane,
  fastavro,
  fasteners,
  grpcio,
  httplib2,
  numpy,
  objsize,
  orjson,
  pillow,
  proto-plus,
  protobuf,
  pyarrow,
  pydot,
  pymongo,
  python-dateutil,
  pytz,
  regex,
  requests,
  typing-extensions,
  zstandard,

  # tests
  python,
  pythonAtLeast,
}:

buildPythonPackage (finalAttrs: {
  pname = "apache-beam";
  version = "2.75.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "apache";
    repo = "beam";
    tag = "v${finalAttrs.version}";
    hash = "sha256-jlY46uVYECZGrT4hCd2eo6QoM4zUm+veGcgcPsHdD5A=";
  };

  sourceRoot = "${finalAttrs.src.name}/sdks/python";

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "distlib==0.4.2" "distlib" \
      --replace-fail "cython>=3.2.5,<4" "cython" \
      --replace-fail "==" ">="

    substituteInPlace setup.py \
      --replace-fail "  copy_tests_from_docs()" ""
  '';

  pythonRelaxDeps = [
    "cryptography"
    "envoy-data-plane"
    "httplib2"
    "jsonpickle"
    "objsize"
    "protobuf"
    "pyarrow"
  ];

  build-system = [
    cython
    distlib
    grpcio-tools
    jinja2
    jsonpickle
    jsonschema
    mypy-protobuf
    redis
    setuptools
    yapf
  ];

  dependencies = [
    beartype
    crcmod
    cryptography
    dill
    envoy-data-plane
    fastavro
    fasteners
    grpcio
    httplib2
    numpy
    objsize
    orjson
    pillow
    proto-plus
    protobuf
    pyarrow
    pydot
    pymongo
    python-dateutil
    pytz
    regex
    requests
    typing-extensions
    zstandard
  ];

  enableParallelBuilding = true;
  pythonImportsCheck = [ "apache_beam" ];
  # Make sure we're running the tests for the actually installed
  # package, so that cython's .so files are available.
  meta = {
    description = "Unified model for defining both batch and streaming data-parallel processing pipelines";
    homepage = "https://beam.apache.org/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
