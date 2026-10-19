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

buildPythonPackage rec {
  pname = "fontmath";
  version = "0.9.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-H9kZDJ14ThMFw8SXcbkdkQ8kakt8RO3iGcmaB+167aQ=";
    extension = "zip";
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
}
