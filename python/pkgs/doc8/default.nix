{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools-scm,
  docutils,
  chardet,
  stevedore,
  restructuredtext-lint,
  pygments,
}:

buildPythonPackage rec {
  pname = "doc8";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-EmetMnWJcfvPmRRCQXo5Nce8nlJVDnNiLg5WulXqHUA=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    docutils
    chardet
    stevedore
    restructuredtext-lint
    pygments
  ];

  pythonImportsCheck = [ "doc8" ];

  meta = {
    description = "Style checker for Sphinx (or other) RST documentation";
    homepage = "https://github.com/pycqa/doc8";
    license = lib.licenses.asl20;
  };
}
