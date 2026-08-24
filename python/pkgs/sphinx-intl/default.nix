{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  babel,
  click,
  setuptools,
  setuptools-scm,
  sphinx,
}:

buildPythonPackage rec {
  pname = "sphinx-intl";
  version = "2.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sphinx-doc";
    repo = "sphinx-intl";
    tag = version;
    hash = "sha256-5Ro+UG9pwwp656fYyCsna6P4s9Gb86Tu3Qm2WUI7tsE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    babel
    click
    setuptools
    sphinx
  ];

  pythonImportsCheck = [ "sphinx_intl" ];

  meta = {
    description = "Sphinx utility that make it easy to translate and to apply translation";
    homepage = "https://github.com/sphinx-doc/sphinx-intl";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
