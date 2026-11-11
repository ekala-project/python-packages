{
  lib,
  buildPythonPackage,
  fetchPypi,
  chameleon,
  colander,
  iso8601,
  peppercorn,
  translationstring,
  zope-deprecation,
  setuptools_80,
  coverage,
  beautifulsoup4,
  flaky,
  pyramid,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "deform";
  version = "3.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-41wBUlJyXlLhlJAPilAxS9dktm49KphrRvRnbw2v5uk=";
  };

  build-system = [ setuptools_80 ];

  dependencies = [
    chameleon
    colander
    iso8601
    peppercorn
    translationstring
    zope-deprecation
    # uses pkg_resources at runtime; pins setuptools<81
    setuptools_80
  ];

  nativeCheckInputs = [
    coverage
    beautifulsoup4
    flaky
    pyramid
    pytestCheckHook
  ];

  pythonImportsCheck = [ "deform" ];

  meta = {
    description = "Form library with advanced features like nested forms";
    homepage = "https://docs.pylonsproject.org/projects/deform/en/latest/";
    # https://github.com/Pylons/deform/blob/fdc43d59de7d11b0e3ba1b92835b780cfe181719/LICENSE.txt
    license = [
      lib.licenses.bsd3
      lib.licenses.cc-by-30
    ];
  };
})
