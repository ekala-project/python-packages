{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # optional-dependencies
  aiodns,
  aiohttp,
  boto3,
  sqlalchemy,
  websocket-client,
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "slack-sdk";
  version = "3.42.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "slackapi";
    repo = "python-slack-sdk";
    tag = "v${finalAttrs.version}";
    hash = "sha256-d0XuzBhn2Ex57xjeAF1q5RcwoWVsFWnlsWUufB3Um4g=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    optional = [
      aiodns
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
