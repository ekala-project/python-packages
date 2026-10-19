{
  lib,
  buildPythonPackage,
  cymem,
  cython,
  fetchPypi,
  # build-system
  setuptools,
  murmurhash,
}:

buildPythonPackage (finalAttrs: {
  pname = "preshed";
  version = "3.0.13";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-119xi7/ZfpkveCfg+n+vapG92cki1bqktQ1icxOWy4k=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ cython ];

  dependencies = [
    cymem
    murmurhash
  ];
  # Tests have import issues with 3.0.8

  pythonImportsCheck = [ "preshed" ];

  # don't update to 4.0.0, version was yanked
  passthru.skipBulkUpdate = true;

  meta = {
    description = "Cython hash tables that assume keys are pre-hashed";
    homepage = "https://github.com/explosion/preshed";
    license = lib.licenses.mit;
  };
})
