{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  hatchling,
  selenium,
}:

buildPythonPackage (finalAttrs: {
  pname = "appium-python-client";
  version = "6.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "appium";
    repo = "python-client";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ARpXFpBufMjboYXsru4I5PDWXNbqJJH3Pj8Oq1sVlMQ=";
  };

  build-system = [ hatchling ];

  dependencies = [ selenium ];

  pythonImportsCheck = [ "appium" ];

  meta = {
    description = "Cross-platform automation framework for all kinds of apps, built on top of the W3C WebDriver protocol";
    homepage = "https://appium.io/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
