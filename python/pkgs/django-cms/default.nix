{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  django,
  setuptools,
  django-classy-tags,
  django-formtools,
  django-treebeard,
  django-sekizai,
  djangocms-admin-style,
  django-cms,
}:

buildPythonPackage rec {
  pname = "django-cms";
  version = "5.0.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-cms";
    repo = "django-cms";
    tag = version;
    hash = "sha256-pYxIW/GGBIKzsQs2QJiRkScDPzSf3YXC+HkDsfAgg/w=";
  };

  build-system = [ setuptools ];

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
