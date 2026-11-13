{
  lib,
  buildPythonPackage,
  fetchPypi,
  httpx,
  hatchling,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "ha-iotawattpy";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "ha_iotawattpy";
    inherit (finalAttrs) version;
    hash = "sha256-5DFpSyuAidEdRGYVMbxEfTFA6uzqABnB0AKRytatdK8=";
  };

  build-system = [ hatchling ];

  dependencies = [ httpx ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "iotawattpy" ];

  meta = {
    description = "Python library for the IoTaWatt Energy device";
    homepage = "https://github.com/home-assistant-libs/iotawattpy";
    license = lib.licenses.gpl3Plus;
  };
})
