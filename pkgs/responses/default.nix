{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  pyyaml,
  requests,
  types-pyyaml,
  types-toml,
  urllib3,
}:

buildPythonPackage rec {
  pname = "responses";
  version = "0.25.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "getsentry";
    repo = "responses";
    tag = version;
    hash = "sha256-7vl8+7cpyJFhGDTzklQn7p5NyEFpzX9Yiz2g7fDCPGk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyyaml
    requests
    types-pyyaml
    types-toml
    urllib3
  ];

  pythonImportsCheck = [ "responses" ];

  doCheck = false;

  meta = {
    description = "Python module for mocking out the requests Python library";
    homepage = "https://github.com/getsentry/responses";
    license = lib.licenses.asl20;
  };
}
