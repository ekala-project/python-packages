{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-barcode";
  version = "0.16.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "WhyNotHugo";
    repo = "python-barcode";
    tag = "v${finalAttrs.version}";
    hash = "sha256-a/w2JxFBm/jqIRnqIB7ZtkdiLnBNjbR0V5SNuau/YxY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  optional-dependencies = {
    images = [ pillow ];
  };

  pythonImportsCheck = [ "barcode" ];

  meta = {
    description = "Create standard barcodes with Python";
    mainProgram = "python-barcode";
    homepage = "https://github.com/WhyNotHugo/python-barcode";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
