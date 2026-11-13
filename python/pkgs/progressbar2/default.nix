{
  lib,
  buildPythonPackage,
  fetchPypi,
  dill,
  freezegun,
  python-utils,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "progressbar2";
  version = "4.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-9BIkObANykFCT3h+pRSEeGhdJldCB4wcfD7eMfBr0AE=";
  };

  postPatch = ''
    sed -i "/-cov/d" pytest.ini
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  # Upstream requires python-utils >= 4.1.4, but every python_utils API used
  # by progressbar is already available in the packaged 3.9.1.
  pythonRelaxDeps = [ "python-utils" ];

  dependencies = [ python-utils ];
  pythonImportsCheck = [ "progressbar" ];

  meta = {
    description = "Text progressbar library";
    homepage = "https://progressbar-2.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
})
