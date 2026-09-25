{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  numpy,
  scipy, # optional, allows spline-related features (see patsy's docs)
}:

buildPythonPackage rec {
  pname = "patsy";
  version = "1.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydata";
    repo = "patsy";
    tag = "v${version}";
    hash = "sha256-tR+mNSLAOmumJNmVwnHvKefAOeYWMhhBjRh40bAQWkw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    scipy
  ];
  pythonImportsCheck = [ "patsy" ];

  meta = {
    description = "Python package for describing statistical models";
    homepage = "https://github.com/pydata/patsy";
    license = lib.licenses.bsd2;
  };
}
