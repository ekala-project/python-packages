{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "dbus-client-gen";
  version = "0.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vRXo72aWoreH/VwzdEAOgoGSRzRf7vy8Z/IA+lnLoWw=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Python Library for Generating D-Bus Client Code";
    homepage = "https://github.com/stratis-storage/dbus-client-gen";
    license = lib.licenses.mpl20;
  };
}
