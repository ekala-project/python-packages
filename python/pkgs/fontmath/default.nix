{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  fonttools,
  setuptools-scm,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "fontmath";
  version = "0.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ews5M22D1/wD+53DxmLvfSaywVNVo0xkPRz70D+J+3Q=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  dependencies = [ fonttools ];

  nativeCheckInputs = [ pytestCheckHook ];

  meta = {
    description = "Collection of objects that implement fast font, glyph, etc. math";
    homepage = "https://github.com/robotools/fontMath/";
    license = lib.licenses.mit;
  };
})
