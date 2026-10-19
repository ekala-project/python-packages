{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pyserial,
}:

buildPythonPackage (finalAttrs: {
  pname = "umodbus";
  version = "1.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AdvancedClimateSystems";
    repo = "uModbus";
    tag = finalAttrs.version;
    hash = "sha256-5IXadb5mjrMwr+L9S1iMN5kba5VGrzYt1p8nBvvLCh4=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyserial ];

  pythonImportsCheck = [ "umodbus" ];

  meta = {
    description = "Implementation of the Modbus protocol";
    homepage = "https://github.com/AdvancedClimateSystems/uModbus/";
    license = lib.licenses.mpl20;
  };
})
