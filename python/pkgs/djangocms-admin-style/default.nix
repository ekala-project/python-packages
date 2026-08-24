{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  django,
  setuptools,
  django-cms,
  djangocms-admin-style,
}:

buildPythonPackage rec {
  pname = "djangocms-admin-style";
  version = "3.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-cms";
    repo = "djangocms-admin-style";
    tag = version;
    hash = "sha256-cDbmC7IJTT3NuVXBnbUVqC7dUfusMdntDGu2tSvxIdQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  # To avoid infinite recursion, we only enable tests when building passthru.tests.
  pythonImportsCheck = [ "djangocms_admin_style" ];

  meta = {
    description = "Django Theme tailored to the needs of django CMS";
    homepage = "https://django-cms.org";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
