{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  jsonschema,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "robotframework";
  version = "7.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "robotframework";
    repo = "robotframework";
    tag = "v${finalAttrs.version}";
    hash = "sha256-z7qJy7sUqTIIjz6nMNiCl2cBAeqsfU/O32YceryNRpY=";
  };

  build-system = [ setuptools ];
  checkPhase = ''
    ${python.interpreter} utest/run.py
  '';

  meta = {
    description = "Generic test automation framework";
    homepage = "https://robotframework.org/";
    license = lib.licenses.asl20;
  };
})
