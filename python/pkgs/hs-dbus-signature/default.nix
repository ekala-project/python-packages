{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytestCheckHook,
  hypothesis,
}:

buildPythonPackage rec {
  pname = "hs-dbus-signature";
  version = "0.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NNnTcSX+K8zU+sj1QBd13h7aEXN9VqltJMNWCuhgZ6I=";
  };

  build-system = [ setuptools ];

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
}
