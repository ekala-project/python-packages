{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytest,
  unzip,
  py,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-catchlog";
  version = "1.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "1w7wxh27sbqwm4jgwrjr9c2gy384aca5jzw9c0wzhl0pmk2mvqab";
    extension = "zip";
  };

  build-system = [ setuptools ];

  dependencies = [
    py
  ];

  nativeBuildInputs = [ unzip ];
  buildInputs = [ pytest ];

  # Requires pytest < 3.1

  meta = {
    license = lib.licenses.mit;
    homepage = "https://pypi.org/project/pytest-catchlog/";
    description = "py.test plugin to catch log messages. This is a fork of pytest-capturelog";
  };
})
