{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,

  # build-system
  poetry-core,

  # dependencies
  grpclib,
  python-dateutil,
  typing-extensions,

  # optional-dependencies
  black,
  jinja2,
  isort,

  # tests
  addBinToPathHook,
  cachelib,
  grpcio-tools,
  pydantic,
  pytest-asyncio,
  pytest-mock,
  tomlkit,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "betterproto";
  version = "2.0.0b7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "danielgtaylor";
    repo = "python-betterproto";
    tag = "v.${finalAttrs.version}";
    hash = "sha256-T7QSPH8MFa1hxJOhXc3ZMM62/FxHWjCJJ59IpeM41rI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "poetry-core>=1.0.0,<2" "poetry-core"
  '';

  build-system = [ poetry-core ];

  dependencies = [
    grpclib
    python-dateutil
    typing-extensions
  ];

  optional-dependencies.compiler = [
    black
    jinja2
    isort
  ];
  # The tests require the generation of code before execution. This requires
  # the protoc-gen-python_betterproto script from the package to be on PATH.
  disabledTestPaths = lib.optionals (pythonAtLeast "3.14") [
    # TypeError: issubclass() arg 1 must be a class
    "tests/test_inputs.py::test_message_can_instantiated[namespace_builtin_types]"
    "tests/test_inputs.py::test_message_equality[namespace_builtin_types]"
    "tests/test_inputs.py::test_message_json[namespace_builtin_types]"
  ];

  meta = {
    description = "Code generator & library for Protobuf 3 and async gRPC";
    mainProgram = "protoc-gen-python_betterproto";
    longDescription = ''
      This project aims to provide an improved experience when using Protobuf /
      gRPC in a modern Python environment by making use of modern language
      features and generating readable, understandable, idiomatic Python code.
    '';
    homepage = "https://github.com/danielgtaylor/python-betterproto";
    license = lib.licenses.mit;
  };
})
