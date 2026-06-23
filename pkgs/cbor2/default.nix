{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
  setuptools,
  withCExtensions ? true,
}:

buildPythonPackage rec {
  pname = "cbor2";
  version = "5.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-sZw1/K6WiKwB73W61dsnMAwlN+tO4A7QfgXYRWoNSTE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  env = lib.optionalAttrs (!withCExtensions) {
    CBOR2_BUILD_C_EXTENSION = "0";
  };

  passthru = {
    inherit withCExtensions;
  };

  pythonImportsCheck = [ "cbor2" ];

  meta = {
    description = "Python CBOR (de)serializer with extensive tag support";
    homepage = "https://github.com/agronholm/cbor2";
    license = lib.licenses.mit;
    mainProgram = "cbor2";
  };
}
