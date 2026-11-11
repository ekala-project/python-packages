{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "dbus-client-gen";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    pname = "dbus_client_gen";
    inherit (finalAttrs) version;
    hash = "sha256-i9vCiNOJeym0rs3P66hEnOrCcCqLcw2cSukaWPPa8zo=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Python Library for Generating D-Bus Client Code";
    homepage = "https://github.com/stratis-storage/dbus-client-gen";
    license = lib.licenses.mpl20;
  };
})
