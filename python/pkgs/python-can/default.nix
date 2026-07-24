{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  hypothesis,
  packaging,
  parameterized,
  msgpack,
  pyserial,
  pytest-cov-stub,
  pytest-timeout,
  setuptools,
  setuptools-scm,
  typing-extensions,
  wrapt,
  uptime,
}:

buildPythonPackage rec {
  pname = "python-can";
  version = "4.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hardbyte";
    repo = "python-can";
    tag = "v${version}";
    hash = "sha256-yF/Ir9FUf9Q8GINeT0H4SixzZGetqumU5N6O3GT3M6A=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    msgpack
    packaging
    typing-extensions
    wrapt
  ];

  pythonRelaxDeps = [ "wrapt" ];

  optional-dependencies = {
    serial = [ pyserial ];
    seeedstudio = [ pyserial ];
    pcan = [ uptime ];
  };
  pythonImportsCheck = [ "can" ];

  meta = {
    description = "CAN support for Python";
    homepage = "https://python-can.readthedocs.io";
    license = lib.licenses.lgpl3Only;
    maintainers = [ ];
  };
}
