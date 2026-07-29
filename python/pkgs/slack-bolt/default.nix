{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  slack-sdk
, # optional-dependencies
  # async
  aiohttp
, websockets
, # adapter
  bottle
, chalice
, cherrypy
, django
, falcon
, fastapi
, flask
, gunicorn
, pyramid
, sanic
, sanic-testing
, starlette
, tornado
, uvicorn
, websocket-client
, werkzeug
,
}:

buildPythonPackage (finalAttrs: {
  pname = "slack-bolt";
  version = "1.29.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "slackapi";
    repo = "bolt-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-3U15V++q/x73LuEgw9uWaIGWulJmPkmkpUxxK1EXuzU=";
  };

  build-system = [ setuptools ];

  dependencies = [ slack-sdk ];

  optional-dependencies = {
    async = [
      aiohttp
      websockets
    ];
    adapter = [
      bottle
      chalice
      cherrypy
      django
      falcon
      fastapi
      flask
      gunicorn
      pyramid
      sanic
      sanic-testing
      starlette
      tornado
      uvicorn
      websocket-client
      werkzeug
    ];
  };

  pythonImportsCheck = [ "slack_bolt" ];

  meta = {
    description = "Framework to build Slack apps using Python";
    homepage = "https://github.com/slackapi/bolt-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
