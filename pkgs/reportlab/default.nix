{
  lib,
  buildPythonPackage,
  charset-normalizer,
  fetchPypi,
  freetype,
  pillow,
  setuptools,
  isPyPy,
}:

let
  ft = freetype.overrideAttrs (oldArgs: {
    dontDisableStatic = true;
  });
in
buildPythonPackage rec {
  pname = "reportlab";
  version = "5.0.0";
  pyproject = true;

  # See https://bitbucket.org/pypy/compatibility/wiki/reportlab%20toolkit
  disabled = isPyPy;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5ElKDGYjriE7uFb7pSMXGytUp79in9oC1eUlp7iZp4Q=";
  };

  postPatch = ''
    # Remove all the test files that require access to the internet to pass.
    rm tests/test_lib_utils.py
    rm tests/test_platypus_general.py
    rm tests/test_platypus_images.py

    # Remove the tests that require Vera fonts installed
    rm tests/test_graphics_render.py
    rm tests/test_graphics_charts.py
  '';

  build-system = [ setuptools ];

  buildInputs = [ ft ];

  dependencies = [
    charset-normalizer
    pillow
  ];

  pythonImportsCheck = [ "reportlab" ];

  meta = {
    description = "Open Source Python library for generating PDFs and graphics";
    homepage = "https://www.reportlab.com/";
    license = lib.licenses.bsd3;
  };
}
