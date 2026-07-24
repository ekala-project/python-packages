{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  meson,
  meson-python,
  numpy,
  setuptools,
}:

buildPythonPackage rec {
  pname = "numpy-financial";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "numpy";
    repo = "numpy-financial";
    tag = "v${version}";
    hash = "sha256-6hSi5Y292Ikfb2m2SLvIHJS0nZcGKgGzvybgmpxReWI=";
  };

  build-system = [
    meson
    meson-python
    setuptools
  ];

  dependencies = [ numpy ];
  pythonImportsCheck = [ "numpy_financial" ];

  meta = {
    homepage = "https://numpy.org/numpy-financial/";
    description = "Collection of elementary financial functions";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
