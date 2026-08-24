{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  # build-system
  setuptools-scm,
  # dependencies
  numpy,
  scipy,
}:

buildPythonPackage (finalAttrs: {
  pname = "pymanopt";
  version = "2.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pymanopt";
    repo = "pymanopt";
    tag = finalAttrs.version;
    hash = "sha256-LOEulticgCWZBCf3qj5KFBHt0lMd4H85368IhG3DQ4g=";
  };

  preConfigure = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"pip==22.3.1",' ""
  '';

  build-system = [
    setuptools-scm
  ];

  dependencies = [
    numpy
    scipy
  ];

  pythonImportsCheck = [ "pymanopt" ];

  meta = {
    description = "Python toolbox for optimization on Riemannian manifolds with support for automatic differentiation";
    homepage = "https://www.pymanopt.org/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
