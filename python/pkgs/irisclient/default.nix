{
  lib,
  buildPythonPackage,
  setuptools,
  fetchFromGitHub,
  requests,
  pytestCheckHook,
  httmock,
  pytest-mock,
}:

buildPythonPackage rec {
  pname = "irisclient";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "houqp";
    repo = "iris-python-client";
    tag = "v${version}";
    hash = "sha256-fXMw2BopkEqjklR6jr7QQIZyxLq6NHKm2rHwTCbtxR0=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  checkInputs = [
    httmock
    pytestCheckHook
    pytest-mock
  ];

  pythonImportsCheck = [ "irisclient" ];

  meta = {
    description = "Python client for Iris REST api";
    homepage = "https://github.com/houqp/iris-python-client";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
