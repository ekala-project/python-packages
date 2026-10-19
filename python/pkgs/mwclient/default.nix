{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  mock,
  pytest-cov-stub,
  pytestCheckHook,
  requests,
  requests-oauthlib,
  responses,
  six,
}:

buildPythonPackage rec {
  version = "0.11.0";
  pname = "mwclient";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mwclient";
    repo = "mwclient";
    tag = "v${version}";
    sha256 = "sha256-qnWVQEG1Ri0z4RYmmG/fxYrlIFFf/6PnP5Dnv0cZb5I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    requests-oauthlib
    six
  ];

  nativeCheckInputs = [
    mock
    pytest-cov-stub
    pytestCheckHook
    responses
  ];

  pythonImportsCheck = [ "mwclient" ];

  meta = {
    description = "Python client library to the MediaWiki API";
    license = lib.licenses.mit;
    homepage = "https://github.com/mwclient/mwclient";
  };
}
