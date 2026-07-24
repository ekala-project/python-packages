{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  # install dependencies
  pytest,
  vcrpy,
  # test dependencies
  hatchling,
  pytest-httpbin,
  pytest-mock,
  requests,
}:

buildPythonPackage rec {
  pname = "pytest-recording";
  version = "0.13.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kiwicom";
    repo = "pytest-recording";
    tag = "v${version}";
    hash = "sha256-S++MnI0GgpQxS6kFkt05kcE4JMW7jyFjJ3o7DhfYoVA=";
  };

  build-system = [ hatchling ];

  buildInputs = [
    pytest
  ];

  dependencies = [ vcrpy ];
  pythonImportsCheck = [ "pytest_recording" ];

  meta = {
    description = "Pytest plugin that allows you recording of network interactions via VCR.py";
    homepage = "https://github.com/kiwicom/pytest-recording";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
