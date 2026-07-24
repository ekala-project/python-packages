{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # optional-dependencies
  aiohttp,
  boto3,
  sqlalchemy,
  websocket-client,
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "slack-sdk";
  version = "3.43.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "slackapi";
    repo = "python-slack-sdk";
    tag = "v${finalAttrs.version}";
    hash = "sha256-slgf9U/Rm0pSV84CZR/8gGhvEi1zowjzE7YG9FsqwKk=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    optional = [
      aiohttp
      boto3
      sqlalchemy
      websocket-client
      websockets
    ];
  };

  pythonImportsCheck = [ "slack_sdk" ];

  meta = {
    description = "Slack Developer Kit for Python";
    homepage = "https://slack.dev/python-slack-sdk/";
    license = lib.licenses.mit;
  };
})
