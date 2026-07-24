{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "screed";
  version = "1.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-N+gWl8fbqVoFNVTltahq/zKXBeHPXfxee42lht7gcrg=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools_scm[toml] >= 4, <6",' '"setuptools_scm[toml] >= 4",' \
      --replace-fail '"setuptools_scm_git_archive",' ""
  '';

  pythonImportsCheck = [ "screed" ];

  meta = {
    description = "Simple read-only sequence database, designed for short reads";
    homepage = "https://pypi.org/project/screed/";
    license = lib.licenses.bsd3;
  };
}
