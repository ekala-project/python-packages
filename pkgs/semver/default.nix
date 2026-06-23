{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "semver";
  version = "3.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-semver";
    repo = "python-semver";
    tag = version;
    hash = "sha256-ry6r2cY/DRTiPxT+ZiumgFbQyHNzL8i1QcQbLWjnDVE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "semver" ];

  meta = {
    description = "Python package to work with Semantic Versioning (http://semver.org/)";
    homepage = "https://python-semver.readthedocs.io/";
    license = lib.licenses.bsd3;
    mainProgram = "pysemver";
  };
}
