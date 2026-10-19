{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  zeroconf,
}:

buildPythonPackage rec {
  pname = "envoy-utils";
  version = "0.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "envoy_utils";
    inherit version;
    sha256 = "13zn0d6k2a4nls9vp8cs0w07bgg4138vz18cadjadhm8p6r3bi0c";
  };

  build-system = [ setuptools ];

  dependencies = [ zeroconf ];

  # Project has no tests

  pythonImportsCheck = [ "envoy_utils" ];

  meta = {
    description = "Python utilities for the Enphase Envoy";
    homepage = "https://pypi.org/project/envoy-utils/";
    license = lib.licenses.gpl3Plus;
  };
}
