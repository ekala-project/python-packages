{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  setuptools-scm,
  versioneer,
  # dependencies
  boltons,
  orjson,
  pyrsistent,
  zope-interface,
}:

buildPythonPackage (finalAttrs: {
  pname = "eliot";
  version = "1.18.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "itamarst";
    repo = "eliot";
    tag = finalAttrs.version;
    hash = "sha256-YUvHdnpWtsy2NlrVLaaewcUPKGLfdfX/zvowV0jcXuw=";
  };

  build-system = [
    setuptools
    setuptools-scm
    versioneer
  ];

  dependencies = [
    boltons
    orjson
    pyrsistent
    zope-interface
  ];

  pythonImportsCheck = [ "eliot" ];

  meta = {
    description = "Logging library that tells you why it happened";
    homepage = "https://eliot.readthedocs.io";
    mainProgram = "eliot-prettyprint";
    license = lib.licenses.asl20;
  };
})
