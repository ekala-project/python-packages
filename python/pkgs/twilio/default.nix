{
  lib,
  aiohttp-retry,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  pyjwt,
  pyngrok,
  pytz,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "twilio";
  version = "9.10.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "twilio";
    repo = "twilio-python";
    tag = finalAttrs.version;
    hash = "sha256-CQWP8QujDvV5+Z5JDUcWhQ4mJZqaXnxpScS9sBxIX4Q=";
  };

  # https://github.com/twilio/twilio-python/pull/919
  patches = [ ./remove-aiounittest.patch ];

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    aiohttp-retry
    pyjwt
    pyngrok
    pytz
    requests
  ];
  pythonImportsCheck = [ "twilio" ];

  meta = {
    description = "Twilio API client and TwiML generator";
    homepage = "https://github.com/twilio/twilio-python/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
