{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "logfury";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-EwpdrOq5rVNJJCUt33BIKqLJZmKzo4JafTCYHQO3aiY=";
  };

  postPatch = ''
    substituteInPlace setup.py --replace-fail "'setuptools_scm<6.0'" "'setuptools_scm'"
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "logfury" ];

  meta = {
    description = "Python module for low-boilerplate logging of method calls";
    homepage = "https://github.com/ppolewicz/logfury";
    license = lib.licenses.bsd3;
  };
}
