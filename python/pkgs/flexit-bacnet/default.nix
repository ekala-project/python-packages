{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "flexit-bacnet";
  version = "2.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "piotrbulinski";
    repo = "flexit_bacnet";
    tag = finalAttrs.version;
    hash = "sha256-MudBn+ki/jqeFK1iz/vAXaXkkddLThO+1T4BXFJ90lk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "flexit_bacnet" ];

  # upstream has no tests

  meta = {
    description = "Client BACnet library for Flexit Nordic series of air handling units";
    homepage = "https://github.com/piotrbulinski/flexit_bacnet";
    license = lib.licenses.mit;
  };
})
