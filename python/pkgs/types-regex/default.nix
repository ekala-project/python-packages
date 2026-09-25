{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "types-regex";
  version = "2026.9.3.20260903";
  pyproject = true;

  src = fetchPypi {
    pname = "types_regex";
    inherit (finalAttrs) version;
    hash = "sha256-7vgqCuCIBvMmCfxIKf7oRfmGct1jeINMNN7DO/jGDPA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "regex-stubs" ];

  # Module has no tests
  doCheck = false;

  meta = {
    description = "Typing stubs for regex";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
})
