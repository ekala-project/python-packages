{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "mullvad-api";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "mullvad_api";
    inherit version;
    sha256 = "0r0hc2d6vky52hxdqxn37w0y42ddh1zal6zz2cvqlxamc53wbiv1";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # Project has no tests
  pythonImportsCheck = [ "mullvad_api" ];

  meta = {
    description = "Python client for the Mullvad API";
    homepage = "https://github.com/meichthys/mullvad-api";
    license = lib.licenses.mit;
  };
}
