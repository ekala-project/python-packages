{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  zope-testrunner,
  six,
  chardet,
}:

buildPythonPackage (finalAttrs: {
  pname = "ghdiff";
  version = "0.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "17mdhi2sq9017nq8rkjhhc87djpi5z99xiil0xz17dyplr7nmkqk";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ zope-testrunner ];
  dependencies = [
    six
    chardet
  ];

  meta = {
    homepage = "https://github.com/kilink/ghdiff";
    license = lib.licenses.mit;
    description = "Generate Github-style HTML for unified diffs";
    mainProgram = "ghdiff";
  };
})
