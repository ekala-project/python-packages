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
  version = "3.44.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "slackapi";
    repo = "python-slack-sdk";
    tag = "v${finalAttrs.version}";
    hash = "sha256-fQJxh5AMu3/a7k6U6GS7uxJF1o27d/GgO1Lm35wX3rU=";
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
