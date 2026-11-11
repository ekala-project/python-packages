{
  lib,
  buildPythonPackage,
  fetchPypi,
  deprecated,
  mss,
  websockets,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "nodriver";
  version = "0.50.99";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-uvjeUyvx54ySmKt+pW6mpYapBCkM5rnufdm6b0A3MhE=";
  };

  dependencies = [
    deprecated
    mss
    websockets
  ];

  build-system = [ setuptools ];

  pythonImportsCheck = [ "nodriver" ];
  # no tests in upstream

  meta = {
    homepage = "https://github.com/ultrafunkamsterdam/nodriver";
    license = lib.licenses.agpl3Only;
    description = "Web automation framework which can bypass bot detection";
    longDescription = ''
      Successor of Undetected-Chromedriver. Providing a blazing fast framework for web
      automation, webscraping, bots and any other creative ideas which are normally
      hindered by annoying anti bot systems like Captcha / CloudFlare / Imperva / hCaptcha
    '';
  };
})
