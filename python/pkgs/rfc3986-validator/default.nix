{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rfc3986-validator";
  version = "0.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "rfc3986_validator";
    inherit (finalAttrs) version;
    hash = "sha256-PUS955IbO57Drk463KNwQ47M68Z2RWRJsUXVM7JA0FU=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "'pytest-runner'," ""
  '';

  meta = {
    description = "Pure python rfc3986 validator";
    homepage = "https://github.com/naimetti/rfc3986-validator";
    license = lib.licenses.mit;
  };
})
