{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "screed";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Dk5q4fPDy0CXa7vCvn4ZGCFhZmbl94QGxAziy/0jqtc=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools_scm[toml] >= 9, <10",' '"setuptools_scm[toml] >= 9",' \
      --replace-fail '"setuptools_scm_git_archive",' ""
  '';

  pythonImportsCheck = [ "screed" ];

  meta = {
    description = "Simple read-only sequence database, designed for short reads";
    homepage = "https://pypi.org/project/screed/";
    license = lib.licenses.bsd3;
  };
}
