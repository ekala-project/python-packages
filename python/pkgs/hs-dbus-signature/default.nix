{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytestCheckHook,
  hypothesis,
}:

buildPythonPackage (finalAttrs: {
  pname = "hs-dbus-signature";
  version = "0.8.1";
  pyproject = true;

  src = fetchPypi {
    pname = "hs_dbus_signature";
    inherit (finalAttrs) version;
    hash = "sha256-iSCSUNuioB4v3x9sQr+tPKZZaG7pHaG9hspugOzImFk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    hypothesis
  ];

  nativeCheckInputs = [
    pytestCheckHook
    hypothesis
  ];

  pythonImportsCheck = [ "hs_dbus_signature" ];

  meta = {
    description = "Hypothesis Strategy for Generating Arbitrary DBus Signatures";
    homepage = "https://github.com/stratis-storage/hs-dbus-signature";
    license = lib.licenses.mpl20;
  };
})
