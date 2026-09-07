{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  django,
  setuptools,
  setuptools-scm,
  django-classy-tags,
  django-formtools,
  django-treebeard,
  django-sekizai,
  djangocms-admin-style,
  django-cms,
}:

buildPythonPackage rec {
  pname = "django-cms";
  version = "5.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-cms";
    repo = "django-cms";
    tag = version;
    hash = "sha256-bwIbCZI1XwN/BQq7WYBJUOsclIaLO4jtVKUpH1iyY/w=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    django
    django-classy-tags
    django-formtools
    django-treebeard
    django-sekizai
    djangocms-admin-style
  ];

  # which depends on this package.
  # To avoid infinite recursion, we only enable tests when building passthru.tests.
  pythonImportsCheck = [ "cms" ];

  meta = {
    description = "Lean enterprise content management powered by Django";
    homepage = "https://django-cms.org";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
