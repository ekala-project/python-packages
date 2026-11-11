{
  lib,
  buildPythonPackage,
  c-ares,
  cffi,
  cmake,
  fetchPypi,
  idna,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pycares";
  version = "5.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-PontxWo3RQRmdiB5WL89vylxxd8NZN6feok+uovyVbQ=";
  };

  nativeBuildInputs = [ cmake ];
  dontUseCmakeConfigure = true;

  build-system = [ setuptools ];

  buildInputs = [ c-ares ];

  dependencies = [
    cffi
    idna
  ];

  propagatedNativeBuildInputs = [ cffi ];

  # Requires network access

  pythonImportsCheck = [ "pycares" ];

  meta = {
    description = "Python interface for c-ares";
    homepage = "https://github.com/saghul/pycares";
    license = lib.licenses.mit;
  };
})
