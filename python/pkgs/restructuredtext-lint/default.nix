{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  docutils,
}:

buildPythonPackage rec {
  pname = "restructuredtext_lint";
  version = "2.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3SUgm54Lcmkp2DBjOfr3I3NKMTfbOCvPJylPoYprxSs=";
  };

  build-system = [ setuptools ];

  dependencies = [ docutils ];

  pythonImportsCheck = [ "restructuredtext_lint" ];

  meta = {
    description = "reStructuredText linter";
    homepage = "https://github.com/twolfson/restructuredtext-lint";
    license = lib.licenses.unlicense;
  };
}
